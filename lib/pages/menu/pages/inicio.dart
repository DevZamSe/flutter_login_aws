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
            imageCarousel(size),
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
              Text('Card1')
            ],
          ),
        )
      ],
    );
  }
}