import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends GetxController {
  final authC = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final emailC = TextEditingController();
  final passC = TextEditingController();

  RxString strLatLong = '...'.obs;
  RxString strAlamat = '...'.obs;
  RxBool loading = false.obs;

// get geo latitude longatitude
  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //location service not enabled, dont continue
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location service Not Enabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    // permission denied forever
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permission denied forever, we cannot access');
    }

    //continue accessing the position of device
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // ignore: dead_code
  //get address
  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    strAlamat('${place.country}, ${place.subLocality}');
  }

  Stream<QuerySnapshot<Object?>> streamProperty() {
    CollectionReference properties = firestore.collection("properties");
    return properties.snapshots();
  }

  Stream<QuerySnapshot<Object?>> streamCategory() {
    CollectionReference streamCategory = firestore.collection("categories");
    return streamCategory.snapshots();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    Position position = await _getGeoLocationPosition();
    getAddressFromLongLat(position);
  }
}
