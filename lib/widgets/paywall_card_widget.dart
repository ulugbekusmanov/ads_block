import 'package:ads_blocker/constants/app_ui_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PayWallCardWidget extends StatefulWidget {
  final String title;
  final String subTitle;

  const PayWallCardWidget(
      {Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  State<PayWallCardWidget> createState() => _PayWallCardWidgetState();
}

class _PayWallCardWidgetState extends State<PayWallCardWidget> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            vertical: AppUIConstants.spacingXxs,
            horizontal: AppUIConstants.spacingM),
        child: Container(
          padding: const EdgeInsets.all(AppUIConstants.spacingXxs),
          decoration: BoxDecoration(
            color: const Color(0xffF4F4F4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            title: Text(
              widget.title,
              style: const TextStyle(
                  fontFamily: "SFPro", fontSize: 17, color:Colors.black,),
            ),
            subtitle: Text(
              widget.subTitle,
              style: const TextStyle(
                  fontFamily: "SFPro", fontSize: 17, color: Color(0xFFA1A1A1)),
            ),
            trailing: Checkbox(
              activeColor: const Color(0xFF70DE7B),
              value: _value,
              onChanged: (bool? value) {
                setState(() {
                  _value = value!;
                });
              },
            ),
          ),
        ));
  }
}
