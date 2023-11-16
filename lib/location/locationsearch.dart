
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';

class LocationSearch extends StatelessWidget {
 LocationSearch({Key? key, required this.mapController}) : super(key: key);

  late  GoogleMapController mapController;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchMapPlaceWidget(
              hasClearButton: true,
              placeType: PlaceType.address,
              placeholder: 'Enter the location',
              apiKey: "AIzaSyBc-YkwrnJuaTY5YF7sb4QDbm1pXCiGDzo",
              onSelected: (Place place) async {
                Geolocation geolocation = (await place.geolocation)!;
                mapController.animateCamera(
                  CameraUpdate.newLatLng(geolocation.coordinates),
                );
                mapController.animateCamera(
                  CameraUpdate.newLatLngBounds(geolocation.bounds, 0),
                );
              },
            ),
            Padding(
      padding: const EdgeInsets.only(top:15),
              // padding: const EdgeInsets.only(top: 15.0),
              child: SizedBox(
              height: 600,
                 width: double.infinity,
                child: GoogleMap(
                  onMapCreated: (GoogleMapController googleMapController) {
                    mapController = googleMapController;
                  },
                  initialCameraPosition: const CameraPosition(
                    zoom: 15.0,
                    target: LatLng(21.1458, 79.0882),
                  ),
                  mapType: MapType.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
