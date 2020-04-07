import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttersecretchat/utils/SliderOnClick.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            imageCarousel,
            SizedBox(height: 12),
            Row(
              children: <Widget>[
                card(size),
                SizedBox(width: size.width*0.01),
                card(size)
              ],
            ),
            Row(
              children: <Widget>[
                card(size),
                SizedBox(width: size.width*0.01),
                card(size)
              ],
            ),
          ],
        )
      ),
    );
  }

  Widget imageCarousel = new Container(
      child: CarouselSlider(
        height: 380,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        pauseAutoPlayOnTouch: Duration(milliseconds: 800),
        items: [
          'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
          'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg',
          'http://pic3.16pic.com/00/55/42/16pic_5542988_b.jpg',
          'http://photo.16pic.com/00/38/88/16pic_3888084_b.jpg'
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
                      }));
            },
          );
        }).toList(),
      )
  );

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('Card1')
                ],
              ),

        )
      ],
    );
  }
}