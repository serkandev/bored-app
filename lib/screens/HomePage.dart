import 'dart:convert';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flat_3d_button/flat_3d_button.dart';
import 'package:im_bored/Screens/welcomePage.dart';
import 'package:im_bored/model/activity_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:im_bored/product/constants/padding_items.dart';
import 'package:im_bored/product/constants/project_texts.dart';
import 'package:im_bored/product/constants/service.dart';

import '../product/widgets/textItem.dart';
import '../view/activity_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var activity;
  bool _isLoading = false;
  bool animate = false;

  bool startFinding = false;

  @override
  void initState() {
    super.initState();
    fetchModel();
  }

  void _changeLoading() {
    _isLoading = !_isLoading;
  }

  Future<void> fetchModel() async {
    _changeLoading();

    final response = await Dio().get(dio_base_url);
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is Object) {
        Map<String, dynamic> activityDataJson = jsonDecode(response.toString());
        var activityData = activtyModel.fromJson(activityDataJson);
        setState(() {
          activity = activityData;
        });
      }
    }

    _changeLoading();
  }

  late AnimationController animateController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(190, 215, 212, 1),
      body: SafeArea(
        child: Padding(
          padding: PaddingUtility().paddingOnlyRL10,
          child: Center(
            child: Column(
              children: [
                Padding(padding: PaddingUtility().paddingTop2x),
                startFinding == false
                    ? const Expanded(flex: 5, child: welcomePage())
                    : Expanded(
                        flex: 5,
                        child: FadeInDown(
                          manualTrigger: true,
                          animate: animate,
                          controller: (controller) => animateController = controller,
                          child: _isLoading != false
                              ? const Center(
                                  child: SizedBox.shrink(),
                                )
                              : activityImage(
                                  activity: activity,
                                ),
                        )),
                Padding(padding: PaddingUtility().paddingTop),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: 50,
                          child: Flat3dButton.text(
                            color: Colors.lightGreen,
                            textColor: Colors.white,
                            onPressed: () {
                              fetchModel();
                              setState(() {
                                startFinding = true;
                                animate = true;
                              });
                              animateController.reset();
                            },
                            text: welcomeScreenButtonText,
                          ),
                        ),
                        textItem(
                          text: welcomeScreenBottomText,
                          font: labelTextStyle(),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
