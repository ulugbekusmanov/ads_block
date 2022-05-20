import 'package:ads_blocker/constants/app_ui_constants.dart';
import 'package:ads_blocker/constants/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardCardWidget extends StatefulWidget {
  final String iconUrl;
  final String title;

  const DashboardCardWidget({Key? key, required this.iconUrl, required this.title})
      : super(key: key);

  @override
  State<DashboardCardWidget> createState() => _DashboardCardWidgetState();
}

class _DashboardCardWidgetState extends State<DashboardCardWidget> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            vertical: AppUIConstants.spacingXs,
            horizontal: AppUIConstants.spacingM),
        child: Container(
          padding: const EdgeInsets.all(AppUIConstants.spacingXs),
          decoration: BoxDecoration(
            color: const Color(0xffF4F4F4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Card(
              child: SvgPicture.asset(widget.iconUrl,color: _lights?Color(0xFF70DE7B):Color(0xFFF05454)),
            ),
            title: Text(
              widget.title,
              style: const TextStyle(fontFamily: "SFPro", fontSize: 17,color: Color(0xFFA1A1A1)),
            ),
            trailing: CupertinoSwitch(
              activeColor: const Color(0xFF34C759),
              trackColor: const Color.fromRGBO(240, 84, 84, 150),
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                });
              },
            ),
          ),
        ));
  }
}
