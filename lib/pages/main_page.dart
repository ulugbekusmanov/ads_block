import 'package:ads_blocker/constants/app_ui_constants.dart';
import 'package:ads_blocker/constants/assets.dart';
import 'package:ads_blocker/constants/clip_path.dart';
import 'package:ads_blocker/pages/settings_page.dart';
import 'package:ads_blocker/widgets/dashboard_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                  height: screenHeight * 0.43,
                  color: connected ? Colors.green : Colors.red,
                ),
                clipper: CustomClipPath(),
              ),
              SafeArea(
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)
                        =>
                        const SettingsPage()
                        ));

                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppUIConstants.spacingM, vertical: AppUIConstants.spacingM),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(Assets.icons.menu),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Image(
                        image: AssetImage(connected
                            ? Assets.images.stickerConnected
                            : Assets.images.stickerNotConnected)),
                    const SizedBox(
                    ),
                    Text(
                        connected
                            ? "Your phone is protected"
                            : "Ads are not blocked",
                        style: const TextStyle(
                            fontFamily: "SFPro",
                            fontSize: AppUIConstants.spacingL,
                            color: Colors.white))
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DashboardCardWidget(
                      iconUrl: Assets.icons.adsBlocked, title: "Ads blocked"),
                  DashboardCardWidget(
                      iconUrl: Assets.icons.bannerBlocked,
                      title: "Banners blocked"),
                  DashboardCardWidget(
                      iconUrl: Assets.icons.pishinigBlocked,
                      title: "Phishing blocked"),
                  DashboardCardWidget(
                      iconUrl: Assets.icons.youtube,
                      title: "Ad on Youtube blocked"),
                  const SizedBox(
                    height: AppUIConstants.spacingXxl,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppUIConstants.spacingM,
                horizontal: AppUIConstants.spacingM),
            child: InkWell(
              onTap: () {
                setState(() {
                  connected = !connected;
                });
              },
              child: Container(
                height: screenHeight * .07,
                decoration: BoxDecoration(
                  color: const Color(0xffF4F4F4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      buttonText(),
                      style:
                          const TextStyle(fontFamily: "SFPro", fontSize: 20),
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppUIConstants.spacingXxs),
                        child: SvgPicture.asset(connected
                            ? Assets.icons.circlePause
                            : Assets.icons.circlePlay))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String buttonText() {
    return connected ? "Stop" : "Start";
  }
}
