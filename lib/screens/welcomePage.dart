import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../product/constants/project_texts.dart';
import '../product/constants/svg_assets.dart';
import '../product/widgets/textItem.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
          color: const Color.fromRGBO(249, 249, 249, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Lottie.asset(
                    thinkingLottie,
                  )),
              Expanded(
                  child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: textItem(
                        text: welcomeTitleText,
                        font: HeaderTextStyle(context),
                      )),
                  Expanded(
                      flex: 2,
                      child: textItem(
                        text: welcomeLabelText,
                        font: labelTextStyle(),
                      )),
                ],
              ))
            ],
          )),
    );
  }
}
