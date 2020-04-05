import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttersecretchat/pages/menu/pages/inicio.dart';
import 'package:fluttersecretchat/pages/menu/pages/maps.dart';
import 'package:fluttersecretchat/pages/menu/pages/perfil.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _page;
  final Inicio _inicio = Inicio();
  final Maps _maps = Maps();
  final Perfil _perfil = Perfil();

  @override
  void initState() {
    _page = 0;
  }

  void changePage(int tappedIndex) {
    setState(() {
      _showPage = _pageChooser(tappedIndex);
      _page = tappedIndex;
    });
  }

  Widget _showPage = new Inicio();
  Widget _pageChooser(int page){
    switch(page){
      case 0:
        return _inicio;
        break;
      case 1:
        return _maps;
        break;
      case 2:
        return _perfil;
        break;
      default:
        return new Container(
            child: new Center(
                child: new Text(
                    'No Page'
                )
            )
        );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.center_focus_weak),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: _page,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(
                16)
        ),
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text('Inicio')),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.map,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.map,
                color: Colors.deepPurple,
              ),
              title: Text('Mapa')),

          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.settings,
                color: Colors.green,
              ),
              title: Text('Perfil'))
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
            child: _showPage
        ),
      )
    );
  }
}