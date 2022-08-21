import 'package:flutter/material.dart';
import 'package:im_bored/product/constants/padding_items.dart';

class textItem extends StatelessWidget {
  textItem({Key? key, required this.text, required this.font}) : super(key: key);
  String text;
  TextStyle font;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PaddingUtility().paddingOnlyRL10,
      child: Text(
        text,
        style: font,
        textAlign: TextAlign.center,
      ),
    );
  }
}
