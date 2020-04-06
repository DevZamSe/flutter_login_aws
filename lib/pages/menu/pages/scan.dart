import 'package:flutter/material.dart';
import 'package:majascan/majascan.dart';
import 'package:flutter/services.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {

  @override
  void initState() {
    super.initState();
    _scanQR();
  }

  //qrscan
  String result = "Hey there !";

  Future _scanQR() async {
    try {
      String qrResult = await MajaScan.startScan(
          title: "Escanea tu código QR",
          titleColor: Colors.white,
          qRCornerColor: Colors.red,
          qRScannerColor: Colors.red);

      setState(() {
        result = qrResult;
      });

    } on PlatformException catch (ex) {
      if (ex.code == MajaScan.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(result)
          ],
        ),
      ),
    );
  }
}
