import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:seven_food/base/provider.dart';
import 'package:seven_food/provider/mapscreen-provider.dart';
import 'package:seven_food/screens/main/showcase-screen.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<MapScreenProvider>(
        model: MapScreenProvider()..init(),
        builder: (context, model, child) {
          return model.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : FlutterMap(
                  options: MapOptions(
                    center: LatLng(43.226756, 76.862570), // 43.226756,76.862570
                    //43.238949, 76.889709
                    zoom: 13.0,
                    maxZoom: 50.0,
                    minZoom: 2.0,
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                          'https://{s}.maps.2gis.com/tiles?x={x}&y={y}&z={z}',
                      subdomains: ['tile0', 'tile1', 'tile2', 'tile3'],
                    ),
                    MarkerLayerOptions(
                      markers: model.markers,
                      // markers: [
                      //   Marker(
                      //     width: 32,
                      //     height: 32,
                      //     point: LatLng(
                      //         43.228257, 76.860896), // 43.228257,76.860896
                      //     builder: (ctx) => IconButton(
                      //       icon: Icon(Icons.home),
                      //       onPressed: () {
                      //         print('map hi1');
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => ShowcaseScreen(
                      //                     showCaseID: 0,
                      //                   )),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      //   Marker(
                      //     width: 32,
                      //     height: 32,
                      //     point: LatLng(43.230704,
                      //         76.868019), //43.230704,76.868019     43.239685,76.894026
                      //     builder: (ctx) => IconButton(
                      //       icon: Icon(Icons.home),
                      //       onPressed: () {
                      //         print('map hi2');
                      //       },
                      //     ),
                      //   ),
                      //   Marker(
                      //     width: 32,
                      //     height: 32,
                      //     point: LatLng(
                      //         43.252635, 76.833363), //43.252635,76.833363
                      //     builder: (ctx) => IconButton(
                      //       icon: Icon(Icons.home),
                      //       onPressed: () {
                      //         print('map hi3');
                      //       },
                      //     ),
                      //   ),
                      //   Marker(
                      //     width: 32,
                      //     height: 32,
                      //     point: LatLng(
                      //         43.239685, 76.894026), //43.239685,76.894026
                      //     builder: (ctx) => IconButton(
                      //       icon: Icon(Icons.home),
                      //       onPressed: () {
                      //         print('map hi4');
                      //       },
                      //     ),
                      //   ),
                      //
                      // ],
                    )
                  ],
                );
        });
  }

  drawMarkers(String latitude, String longitude) {
    return Marker(
      width: 32,
      height: 32,
      point:
          LatLng(latitude as double, longitude as double), //43.239685,76.894026
      builder: (ctx) => IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          print('map hi4');
        },
      ),
    );
  }
}
