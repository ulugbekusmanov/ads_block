import 'package:ads_blocker/constants/app_ui_constants.dart';
import 'package:ads_blocker/constants/assets.dart';
import 'package:ads_blocker/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/dots_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

final _controller = PageController();

class _OnBoardingPageState extends State<OnBoardingPage> {
  static const _kDuration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    final List<Widget> _pages1 = <Widget>[
      Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Image(image: AssetImage(Assets.images.boarding1)),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppUIConstants.spacingS),

            child: const Text(
              "Adware block",
              style: TextStyle(
                  fontSize: 28, fontFamily: "SFPro", color: Colors.black),
            ),
          ),
          Expanded(
            child: const Padding(
              padding:
              EdgeInsets.symmetric(horizontal: AppUIConstants.spacingXxs),
              child: Text(
                "Will hide pop-up ads and any annoying  interference on the page",
                textAlign: TextAlign.center,

                style: TextStyle(
                    fontSize: 18, fontFamily: "SFPro", color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Image(image: AssetImage(Assets.images.boarding2)),
          const SizedBox(
            height: 32,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppUIConstants.spacingS),
            child: Text(
              "Secure your surfing",
              style: TextStyle(
                  fontSize: 28, fontFamily: "SFPro", color: Colors.black),
            ),
          ),
          Expanded(
            child: const Padding(
              padding:
              EdgeInsets.symmetric(horizontal: AppUIConstants.spacingXxs),
              child: Text(
                "Does not allow theft persona data, control the flow of information",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18, fontFamily: "SFPro", color: Colors.black),
              ),
            ),
          ),
        ],
      ),
      Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Image(image: AssetImage(Assets.images.boarding3)),
          const SizedBox(
            height: 32,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 52, vertical: AppUIConstants.spacingXxxs),
              child: Text(
                "Secure your surfing",
                style: TextStyle(
                  fontSize: 28, fontFamily: "SFPro", color: Colors.black,),
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 45, vertical: AppUIConstants.spacingXxxs),
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(
                      horizontal: AppUIConstants.spacingXs),
                      child: SvgPicture.asset(Assets.icons.trendingUp)),
                  const Text(
                    "Quick turn on",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "SFPro",
                        color: Color(0xFF414141)),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 45, vertical: AppUIConstants.spacingXxxs),
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(
                      horizontal: AppUIConstants.spacingXs),
                      child: SvgPicture.asset(Assets.icons.stopSign)),
                  const Text(
                    "Blocks ads and pop-up notifications",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "SFPro",
                        color: Color(0xFF414141)),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 45, vertical: AppUIConstants.spacingXxxs),
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(
                      horizontal: AppUIConstants.spacingXs),
                      child: SvgPicture.asset(Assets.icons.shieldCheck)),
                  const Text(
                    "Optimzes device performance",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "SFPro",
                        color: Color(0xFF414141)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ];
    return CupertinoPageScaffold(
        child: Column(
          children: [
            SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppUIConstants.spacingM, vertical: AppUIConstants.spacingM,),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)
                          =>
                          const MainPage()
                          ));

                        },
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "SFPro",
                              color: Color(0xFFA1A1A1)),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 5,
              child: PageView.builder(
                onPageChanged: _onPageViewChange,
                physics: AlwaysScrollableScrollPhysics(),
                controller: _controller,
                itemCount: _pages1.length,
                itemBuilder: (BuildContext context, int index) {
                  return _pages1[index % _pages1.length];
                },
              ),
            ),
            index != 2
                ? Flexible(
              child: DotsIndicator(
                pageViewIndex: index,
                color: Colors.black,
                controller: _controller,
                itemCount: _pages1.length,
                onPageSelected: (int page) {
                  _controller.animateToPage(
                    page,
                    duration: _kDuration,
                    curve: _kCurve,
                  );
                },
              ),
            )
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppUIConstants.spacingM, vertical: AppUIConstants.spacingXl),
              child: SizedBox(
                height: screenHeight * .07,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Text(
                    index != 2 ? "Next" : "Subscribe now",
                    style: TextStyle(
                      fontSize: 17,
                      color: index == 2 ? Colors.white : Color(0xFF414141),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    if (index == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainPage()),
                      );
                    } else {
                      _controller.animateToPage(
                        index + 1,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    }
                  },
                  color: index != 2 ? Color(0xffF4F4F4) : Color(0xff70DE7B),
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }

  _onPageViewChange(int page) {
    setState(() {
      index = page;
    });
  }
}
