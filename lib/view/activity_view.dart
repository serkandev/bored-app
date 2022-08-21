import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:im_bored/model/activity_model.dart';
import 'package:im_bored/product/constants/colors.dart';
import 'package:im_bored/product/constants/project_texts.dart';
import 'package:im_bored/product/widgets/textItem.dart';
import 'package:url_launcher/url_launcher.dart';

class activityImage extends StatefulWidget {
  activtyModel activity;
  activityImage({Key? key, required this.activity}) : super(key: key);

  @override
  State<activityImage> createState() => _activityImageState();
}

class _activityImageState extends State<activityImage> {
  @override
  Widget build(BuildContext context) {
    return Card(
        color: ColorsUtility().cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            Expanded(flex: 2, child: SvgPicture.asset("assets/${widget.activity.type}.svg")),
            Expanded(
                child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: textItem(
                      text: widget.activity.activity,
                      font: HeaderTextStyle(context),
                    )),
                Expanded(
                    flex: 2,
                    child: textItem(
                      text: widget.activity.type,
                      font: labelTextStyle(),
                    )),
                widget.activity.link == ""
                    ? const SizedBox.shrink()
                    : Expanded(
                        flex: 2,
                        child: TextButton(
                          onPressed: () {
                            _launchUrl(Uri.parse(widget.activity.link));
                          },
                          child: const Text("More information"),
                        )),
              ],
            ))
          ],
        ));
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
