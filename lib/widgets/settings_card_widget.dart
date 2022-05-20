import 'package:ads_blocker/constants/app_ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsCardWidget extends StatefulWidget {
  final String iconPath;
  final String title;

  const SettingsCardWidget(
      {Key? key, required this.iconPath, required this.title})
      : super(key: key);

  @override
  State<SettingsCardWidget> createState() => _SettingsCardWidgetState();
}

class _SettingsCardWidgetState extends State<SettingsCardWidget> {
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
            leading: SvgPicture.asset(widget.iconPath),
            title: Text(
              widget.title,
              style: const TextStyle(fontFamily: "SFPro", fontSize: 17,color: Color(0xFFA1A1A1)),
            ),
          ),
        ));
  }
}
