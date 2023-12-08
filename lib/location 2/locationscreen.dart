// ignore_for_file: implementation_imports, depend_on_referenced_packages

import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';
import 'package:google_maps_webservice/places.dart'; 
import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_maps/google_maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_webservice/src/places.dart';
import 'package:yatra1/location/locationservice.dart';

class LocationController extends GetxController{
 final Placemark _pickPlaceMark = Placemark();
  Placemark get pickPlaceMark=> _pickPlaceMark;

  List<Prediction> _predictionList = [];

  Future<List<Prediction>> searchLocation(BuildContext context, String text) async {
    // ignore: unnecessary_null_comparison
    if(text != null && text.isNotEmpty) {
      http.Response response = await getLocationData(text);
      var data = jsonDecode(response.body.toString());
      print("my status is "+data["status"]);
      if ( data['status']== 'OK') {
        _predictionList = [];
        data['predictions'].forEach((prediction)
        => _predictionList.add(Prediction.fromJson(prediction)));
      } else {
        // ApiChecker.checkApi(response);
      }
    }
    return _predictionList;
  }

  void setMapController(GoogleMapController mapController) {}}