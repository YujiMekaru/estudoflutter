import 'dart:async';

import '../screens/loginscreen.dart';

import '../model/slide.dart';
import '../widgets/slide_dots.dart';
import '../widgets/slide_item.dart';
import 'package:flutter/material.dart';

import '../screens/cadastroscreen.dart';

class TituloScreen extends StatefulWidget {
  @override
  _TituloScreen createState() => _TituloScreen();
}

class _TituloScreen extends State<TituloScreen> {
  int _currentPage = 0;

  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
            left: 32.0, right: 32.0, top: 128.0, bottom: 20.0),
        child: Column(
          children: [
            Text(
              'Amigo Mecânico',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'O seu assistente automotivo',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 300,
              width: 400,
              padding:
                  const EdgeInsets.only(top: 102.0, left: 30.0, right: 30.0),
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  PageView.builder(
                    itemBuilder: (context, position) {
                      return SlideItem(position);
                    },
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    onPageChanged: _onPageChanged,
                    itemCount: slideList.length,
                  ),
                  Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for (int i = 0; i < slideList.length; i++)
                                if (i == _currentPage)
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ])
                ],
              ),
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadastroScreen()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.lightBlue),
                child: Text('CADASTRE-SE'),
              ),
            ),
            SizedBox(
              width: 300,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'Já possui acesso? ENTRAR',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
