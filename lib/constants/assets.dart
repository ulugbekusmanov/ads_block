abstract class Assets {
  const Assets._();

  static _Icons get icons => const _Icons();

  static _Images get images => const _Images();
}

abstract class _AssetsHolder {
  final String basePath;

  const _AssetsHolder(this.basePath);
}

class _Icons extends _AssetsHolder {
  const _Icons() : super('assets/icons');

  String get adsBlocked => '$basePath/ads_blocked.svg';

  String get back => '$basePath/back.svg';

  String get bannerBlocked => '$basePath/banner_blocked.svg';

  String get circlePause => '$basePath/circle_pause.svg';

  String get circlePlay => '$basePath/circle_play.svg';

  String get connectionInstruction => '$basePath/connection_instruction.svg';

  String get contactSupport => '$basePath/contact_support.svg';

  String get menu => '$basePath/menu.svg';

  String get pishinigBlocked => '$basePath/pishinig_blocked.svg';

  String get premium => '$basePath/premium.svg';

  String get privacyPolicy => '$basePath/privacy_policy.svg';

  String get questionMark => '$basePath/question_mark.svg';

  String get restorePurchase => '$basePath/restore_purchase.svg';

  String get shieldCheck => '$basePath/shield_check.svg';

  String get stopSign => '$basePath/stop_sign.svg';

  String get termsOfUse => '$basePath/terms_of_use.svg';

  String get trendingUp => '$basePath/trending_up.svg';

  String get youtube => '$basePath/youtube.svg';
}

class _Images extends _AssetsHolder {
  const _Images() : super('assets/images');

  String get boarding1 => '$basePath/boarding_1.png';

  String get boarding2 => '$basePath/boarding_2.png';

  String get boarding3 => '$basePath/boarding_3.png';

  String get instruction1 => '$basePath/instruction_1.png';

  String get instruction2 => '$basePath/instruction_2.png';

  String get instruction3 => '$basePath/instruction_3.png';

  String get instruction4 => '$basePath/instruction_4.png';

  String get stickerNotConnected => '$basePath/sticker_not_connected.png';

  String get stickerPremium => '$basePath/sticker_premium.png';

  String get stickerConnected => '$basePath/sticker_connected.png';

}
