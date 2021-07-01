import 'package:flutter/material.dart';
import '../model/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          slideList[index].title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
        ),
        Text(slideList[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
      ],
    );
  }
}
