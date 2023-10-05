import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_property_controller.dart';

class AddPropertyView extends GetView<AddPropertyController> {
  const AddPropertyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 246, 250, 1),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Add Property'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined))
        ],
      ),
      body: SizedBox(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  color: Colors.black,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(244, 246, 250, 1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      const Text(
                        'Property',
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 50),
                      TextField(
                        controller: controller.propertyTitle,
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: "Title",
                          labelStyle: TextStyle(color: Colors.green),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      TextField(
                        controller: controller.propertyLocation,
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: "Location",
                          labelStyle: TextStyle(color: Colors.green),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      TextField(
                        controller: controller.propertySurface,
                        style: TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: "Surface Area",
                          labelStyle: TextStyle(color: Colors.green),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
          child: SizedBox(
            width: 310,
            child: FloatingActionButton.extended(
              onPressed: () {
                controller.addProperty(
                    controller.propertyTitle.text,
                    controller.propertyLocation.text,
                    controller.propertySurface.text);
              },
              label: const Text(
                'Save',
                style: TextStyle(
                    color: Color.fromRGBO(129, 252, 111, 1),
                    fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
