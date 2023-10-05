import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_cli2/app/modules/profile/controllers/profile_controller.dart';

class Produk extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamProperty(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listProperty = snapshot.data!.docs;
            return GridView.builder(
              itemCount: listProperty.length,
              itemBuilder: (context, index) =>
                  // Grid Photo Property
                  Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/property/${(index % 2) == 0 ? 'house1.jpg' : 'house3.jpg'}"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 10,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    icon: const Icon(
                                      Icons.favorite_border_outlined,
                                      size: 14,
                                    ),
                                    color: Colors.black,
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 0, 7),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '\$${(listProperty[index].data() as Map<String, dynamic>)["price"]}',
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${(listProperty[index].data() as Map<String, dynamic>)["title"]}, ${(listProperty[index].data() as Map<String, dynamic>)["location"]}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 10,
                                      child: IconButton(
                                        padding: const EdgeInsets.all(0),
                                        icon: const Icon(
                                          Icons.car_repair_outlined,
                                          size: 14,
                                        ),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Text(
                                        '4 Bds',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 10,
                                      child: IconButton(
                                        padding: const EdgeInsets.all(0),
                                        icon: const Icon(
                                          Icons.bathroom_outlined,
                                          size: 14,
                                        ),
                                        color: Colors.white,
                                        onPressed: () {},
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                      child: Text(
                                        'Bath',
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //End of Grid Photo Property

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (4 / 5),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
