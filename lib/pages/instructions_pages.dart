import 'package:ads_blocker/constants/app_ui_constants.dart';
import 'package:ads_blocker/constants/assets.dart';
import 'package:ads_blocker/constants/clip_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/dots_indicator.dart';

class InstractionsPage extends StatefulWidget {
  const InstractionsPage({Key? key}) : super(key: key);

  @override
  State<InstractionsPage> createState() => _InstractionsPageState();
}

class _InstractionsPageState extends State<InstractionsPage> {
  var connected = false;

  final List<Widget> _pages = <Widget>[
    SizedBox(
        height: 450,
        width: 300,
        child: Image(image: AssetImage(Assets.images.instruction2))),
    SizedBox(
        height: 450,
        width: 300,
        child: Image(image: AssetImage(Assets.images.instruction3))),
    SizedBox(
        height: 450,
        width: 300,
        child: Image(image: AssetImage(Assets.images.instruction4))),
  ];

  final _controller = PageController();

  static const _kDuration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  color: connected ? Colors.green : Color(0xFFF05454),
                ),
                clipper: CustomClipPath(),
              ),
              SafeArea(
                  child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppUIConstants.spacingM),
                        child: SvgPicture.asset(Assets.icons.back)),
                  ),
                  const Text(
                    "Connection instructions",
                    style: TextStyle(
                        fontSize: 19, fontFamily: "SFPro", color: Colors.white),
                  )
                ],
              )),
            ],
          ),
          const Text(
            "1. Open the Settings",
            style: TextStyle(
                fontSize: 21, fontFamily: "SFPro", color: Colors.black),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            flex: 5,
            child: PageView.builder(
              onPageChanged: _onPageViewChange,
              physics: AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemCount: _pages.length,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: DotsIndicator(
                  pageViewIndex: index,
                  color: Colors.black,
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageSelected: (int page) {
                    _controller.animateToPage(
                      page,
                      duration: _kDuration,
                      curve: _kCurve,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onPageViewChange(int page) {
    setState(() {
      index = page;
    });
  }
}
