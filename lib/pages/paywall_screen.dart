import 'package:ads_blocker/constants/app_ui_constants.dart';
import 'package:ads_blocker/constants/assets.dart';
import 'package:ads_blocker/constants/clip_path.dart';
import 'package:ads_blocker/pages/instructions_pages.dart';
import 'package:ads_blocker/widgets/paywall_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayWallScreen extends StatefulWidget {
  const PayWallScreen({Key? key}) : super(key: key);

  @override
  State<PayWallScreen> createState() => _PayWallScreenState();
}

class _PayWallScreenState extends State<PayWallScreen> {
  bool connected = false;
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: screenHeight * .3,
                  color: connected ? Colors.green : Color(0xFFF05454),
                ),
                clipper: CustomClipPath(),
              ),
              Column(
                children: [
                  SafeArea(
                      child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppUIConstants.spacingL, vertical:AppUIConstants.spacingM ),
                            child: SvgPicture.asset(Assets.icons.back)),
                      ),
                      const Text(
                        "Go Premium",
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: "SFPro",
                            color: Colors.white),
                      )
                    ],
                  )),
                  const SizedBox(
                    height: 56,
                  ),
                  Column(
                    children: [
                      Image(image: AssetImage(Assets.images.stickerPremium)),
                      const Text(
                        "Get rid of all the clutter with a",
                        style: TextStyle(
                            fontSize: 19,
                            fontFamily: "SFPro",
                            color: Colors.black),
                      ),
                      const Text(
                        "Premium Subscription",
                        style: TextStyle(
                          fontSize: 19,
                          fontFamily: "SFPro",
                          color: Color(0xFF70DE7B),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  SizedBox(
                    height: AppUIConstants.spacingXl,
                  ),
                  PayWallCardWidget(
                      title: "Start 3 Day Free Trial",
                      subTitle: 'After \$15,99 every week'),
                  PayWallCardWidget(
                      title: "Start 3 Day Free Trial",
                      subTitle: 'After \$24,99 for month'),
                  PayWallCardWidget(
                      title: "Start 3 Day Free Trial",
                      subTitle: 'After \$24,99 for month'),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppUIConstants.spacingXl,
                  horizontal: AppUIConstants.spacingM),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * .07,
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: const Text(
                        "Subscribe now",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InstractionsPage()),
                        );
                      },
                      color: const Color(0xff70DE7B),
                      textColor: Colors.white,
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(AppUIConstants.spacingXxs),
                      child: const Text(
                        "Privacy Policy - Terms of use",
                        style: TextStyle(color: Color(0xFFA1A1A1)),
                      ))
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
