import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPropertyController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final propertyTitle = TextEditingController();
  final propertyLocation = TextEditingController();
  final propertySurface = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  // add property to firebase
  void addProperty(String title, String location, String surface) async {}
}
