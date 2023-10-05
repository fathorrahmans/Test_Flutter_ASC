import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPropertyController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  late TextEditingController propertyTitle;
  late TextEditingController propertyLocation;
  late TextEditingController propertySurface;
  late TextEditingController propertyPrice;

  // add property to firebase
  void addProperty(
      String title, String location, String surface, String price) async {
    CollectionReference property = firestore.collection("properties");
    try {
      await property.add({
        "title": title,
        "location": location,
        "surface": surface,
        "price": price,
      });

      Get.defaultDialog(
        title: "Success",
        middleText: "Property was added",
        onConfirm: () => Get.back(),
        textConfirm: "OKAY",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Error!",
        middleText: "Error to save property",
      );
    }
  }

  @override
  void onInit() {
    propertyTitle = TextEditingController();
    propertyLocation = TextEditingController();
    propertySurface = TextEditingController();
    propertyPrice = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    propertyTitle.dispose();
    propertyLocation.dispose();
    propertySurface.dispose();
    propertyPrice.dispose();
    super.onClose();
  }
}
