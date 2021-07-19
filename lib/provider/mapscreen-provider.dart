import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:seven_food/base/bloc.dart';
import 'package:seven_food/data/model/showcase-locations-model.dart';
import 'package:seven_food/data/services/showcase-service.dart';
import 'package:seven_food/screens/main/showcase-screen.dart';

class MapScreenProvider extends BaseBloc {
  late List<LocationModel> showcases;
  ShowCaseService _showcaseService = ShowCaseService();
  var markers = <Marker>[];

  String urlTemplate = 'https://{s}.maps.2gis.com/tiles?x={x}&y={y}&z={z}';

  getMarkers() {
    showcases.forEach((element) {
      markers.add(
        Marker(
          width: 32,
          height: 32,
          point: LatLng(
            double.parse(element.latitude),
            double.parse(element.longitude),
          ),
          builder: (context) => IconButton(
            icon: Icon(
              Icons.home,
              color: Color(0xff2F82D2),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShowcaseScreen(showCaseID: element.id,),
                ),
              );
            },
          ),
        ),
      );
    });
    return markers;
  }

  init() async {
    setLoading(true);
    showcases = await _showcaseService.getShowCases();
    getMarkers();
    setLoading(false);
  }
}