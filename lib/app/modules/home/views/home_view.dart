// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_cli2/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 50),
                    child: Column(
                      children: [
                        // AppBar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    'assets/images/avatar.jpg',
                                    fit: BoxFit.cover,
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Hi, Diana',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_pin,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        Obx(
                                          () => Text(
                                            '${controller.strAlamat.value}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(30, 32, 57, 1),
                                shape: CircleBorder(), //<-- SEE HERE
                                padding: EdgeInsets.all(16),
                              ),
                              child: const Icon(
                                Icons.notifications_none,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                        // End of AppBar
                        const SizedBox(height: 20),
                        // TextField for Search
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(30, 32, 57, 1),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintText: 'Search...',
                            hintStyle: TextStyle(color: Colors.white),
                            suffixIcon: Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.greenAccent,
                                    Colors.yellowAccent
                                  ],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 15,
                                child: IconButton(
                                  padding: const EdgeInsets.all(0),
                                  icon: const Icon(Icons.settings),
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        // End of TextField for Search
                        const SizedBox(height: 20),
                        // Menu All | House | Appartment
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: StreamBuilder<QuerySnapshot<Object?>>(
                            stream: controller.streamCategory(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                var listCategories = snapshot.data!.docs;
                                return ListView.builder(
                                  itemCount: listCategories.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Color.fromRGBO(22, 28, 44, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(7),
                                        child: Row(children: [
                                          ClipOval(
                                            child: Image.asset(
                                              'assets/property/${(index % 2) == 0 ? 'house1.jpg' : 'house3.jpg'}',
                                              fit: BoxFit.cover,
                                              width: 35,
                                              height: 35,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 10, 0),
                                            child: Text(
                                              '${(listCategories[index].data() as Map<String, dynamic>)["title"]}',
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          ),
                        ),
                        // End of Menu All | House | Appartment
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Top Property',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text('View all'),
                          ],
                        ),
                        const SizedBox(height: 15),
                        // Property Slider
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 410,
                          child: StreamBuilder<QuerySnapshot<Object?>>(
                            stream: controller.streamProperty(),
                            // future: controller.getProperty(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                var listProperty = snapshot.data!.docs;
                                return ListView.builder(
                                  itemCount: listProperty.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) => Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child:
                                        // item property slider
                                        Container(
                                      width: 300,
                                      height: 400,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30)),
                                        image: DecorationImage(
                                          alignment: Alignment.center,
                                          matchTextDirection: true,
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              "assets/property/${(index % 2) == 0 ? 'house1.jpg' : 'house3.jpg'}"),
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    radius: 15,
                                                    child: IconButton(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      icon: const Icon(Icons
                                                          .favorite_border_outlined),
                                                      color: Colors.black,
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.black12,
                                                      Colors.black87,
                                                    ]),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        20, 10, 20, 20),
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        '\$${(listProperty[index].data() as Map<String, dynamic>)["price"]}k \n${(listProperty[index].data() as Map<String, dynamic>)["title"]}, ${(listProperty[index].data() as Map<String, dynamic>)["location"]}',
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                radius: 13,
                                                                child:
                                                                    IconButton(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          0),
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .car_repair_outlined),
                                                                  color: Colors
                                                                      .black,
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                              ),
                                                              const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  '4 Bds',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                radius: 13,
                                                                child:
                                                                    IconButton(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          0),
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .bathroom_outlined),
                                                                  color: Colors
                                                                      .black,
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                              ),
                                                              const Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: Text(
                                                                  'Bath',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Container(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              CircleAvatar(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                radius: 13,
                                                                child:
                                                                    IconButton(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          0),
                                                                  icon: const Icon(
                                                                      Icons
                                                                          .ac_unit),
                                                                  color: Colors
                                                                      .black,
                                                                  onPressed:
                                                                      () {},
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                        5,
                                                                        0,
                                                                        0,
                                                                        0),
                                                                child: Text(
                                                                  '${(listProperty[index].data() as Map<String, dynamic>)["surface"]} ft2',
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // End of item property slider
                                );
                              }
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                          ),
                        )
                        // End of Property Slider
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.black,
            boxShadow: [
              BoxShadow(color: Colors.black87, spreadRadius: 0, blurRadius: 5),
            ],
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      '• Home',
                      style: TextStyle(color: Color.fromRGBO(129, 252, 111, 1)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      fixedSize: Size(50, 50),
                      elevation: 0,
                    ),
                    child: const Icon(Icons.camera_alt_outlined),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(Icons.add),
                      color: Colors.black,
                      onPressed: () => Get.toNamed(Routes.ADD_PROPERTY),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      fixedSize: Size(50, 50),
                      elevation: 0,
                    ),
                    child: const Icon(Icons.message_outlined),
                  ),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.PROFILE),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      fixedSize: Size(50, 50),
                      elevation: 0,
                    ),
                    child: const Icon(Icons.people_alt_outlined),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
