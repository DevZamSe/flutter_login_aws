import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:fluttersecretchat/utils/SliderOnClick.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  var data = [0.0, 1.0, 1.5, 2.0];
  var data1 = [0.0,-2.0,3.5,-2.0];

  List<CircularStackEntry> circularData = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(700.0, Color(0xff4285F4), rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Color(0xfff3af00), rankKey: 'Q2'),
        new CircularSegmentEntry(1800.0, Color(0xffec3337), rankKey: 'Q3'),
        new CircularSegmentEntry(1000.0, Color(0xff40b24b), rankKey: 'Q4'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            imageCarousel(size),
            SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  card(size),
                  SizedBox(width: size.width*0.01),
                  card1(size)
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child:
              Row(
                children: <Widget>[
                  card2(size),
                  SizedBox(width: size.width*0.01),
                  card(size)
                ],
              )
            )
          ],
        )
      ),
    );
  }

  Widget imageCarousel(Size size){
    return Container(
      child: CarouselSlider(
        height: size.height*0.47,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        pauseAutoPlayOnTouch: Duration(milliseconds: 800),
        items: [
          'https://www.aithority.com/wp-content/uploads/2019/05/Endesa-taps-IBM-Watson-and-IBM-Cloud-to-deliver-superior-Customer-Service-through-its-AI-Contact-Center.jpg',
          'https://especiales.realinstitutoelcano.org/coronavirus/img/cards/mapa-coronavirus.png',
          'https://www.pngfind.com/pngs/m/598-5987542_grafico-slides-sin-logo-el-per-primero-hd.png'
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: GestureDetector(
                  child: Image.network(i, fit: BoxFit.fill),
                  onTap: () {
                    Navigator.push<Widget>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageScreen(i),
                      ),
                    );
                  }
                )
              );
            },
          );
        }).toList(),
      )
    );
  }

  Widget card(Size size){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10, top: 10),
          height: size.height*0.158,
          width: size.width*0.45,
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _chart()
            ],
          ),
        )
      ],
    );
  }

  Widget card1(Size size){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(1.0),
          child: Sparkline(
            data: data,
            lineColor: Color(0xffff6101),
            pointsMode: PointsMode.all,
            pointSize: 8.0,
          ),
        ),
      ],
    );
  }

  Widget card2(Size size){
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(1.0),
          child: new Sparkline(
            data: data1,
            fillMode: FillMode.below,
            fillGradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.amber[800], Colors.amber[200]],
            ),
          ),
        )
      ],
    );
  }

  Widget _chart(){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding:EdgeInsets.all(8.0),
                    child:AnimatedCircularChart(
                      size: const Size(90.0, 90.0),
                      initialChartData: circularData,
                      chartType: CircularChartType.Pie,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}