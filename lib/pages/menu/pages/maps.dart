import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: new MapOptions(
        center: new LatLng(-12.043850299999999, -76.9286219),
        zoom: 16.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(-12.043850299999999, -76.9286219),
              builder: (ctx) => Container(
                child: IconButton(
                  icon: Icon(Icons.accessibility),
                  color: Colors.black26,
                  iconSize: 40.0,
                  onPressed: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (builder){
                          return Container(
                            height: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12
                            ),
                            child: _BoxClick(),
                          );
                        }
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _BoxClick(){
    return Center(
      child: Column(
        children: <Widget>[
          Text('Texto')
        ],
      ),
    );
  }
}
