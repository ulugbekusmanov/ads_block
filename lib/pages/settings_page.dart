import 'package:ads_blocker/constants/app_ui_constants.dart';
import 'package:ads_blocker/constants/assets.dart';
import 'package:ads_blocker/constants/clip_path.dart';
import 'package:ads_blocker/pages/paywall_screen.dart';
import 'package:ads_blocker/widgets/settings_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool connected = false;

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
              SafeArea(
                  child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppUIConstants.spacingM),
                        child: SvgPicture.asset(Assets.icons.back)),
                  ),
                  const Text(
                    "Settings",
                    style: TextStyle(
                        fontSize: 19, fontFamily: "SFPro", color: Colors.white),
                  )
                ],
              ))
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SettingsCardWidget(
                      iconPath: Assets.icons.privacyPolicy, title: "Privacy Policy"),
                  SettingsCardWidget(
                      iconPath: Assets.icons.termsOfUse, title: "Terms of use"),
                  SettingsCardWidget(
                      iconPath: Assets.icons.restorePurchase,
                      title: "Restore purchase"),
                  SettingsCardWidget(
                      iconPath: Assets.icons.contactSupport, title: "Contact support"),
                  SettingsCardWidget(
                      iconPath: Assets.icons.connectionInstruction,
                      title: "Connection instructions"),
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
              child: SizedBox(
                height: screenHeight * .07,
                width: MediaQuery.of(context).size.width,
                child: FlatButton(


                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: AppUIConstants.spacingXs),
                          child: SvgPicture.asset(Assets.icons.premium)),
                      const Text(
                        "Go Premium",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PayWallScreen()),
                    );
                  },
                  color: const Color(0xff70DE7B),
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
