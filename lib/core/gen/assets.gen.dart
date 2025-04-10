/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/All in one.svg
  SvgGenImage get allInOne => const SvgGenImage('assets/svgs/All in one.svg');

  /// File path: assets/svgs/Pass-Eye-slash.svg
  SvgGenImage get passEyeSlash =>
      const SvgGenImage('assets/svgs/Pass-Eye-slash.svg');

  /// File path: assets/svgs/Pass-Eye.svg
  SvgGenImage get passEye => const SvgGenImage('assets/svgs/Pass-Eye.svg');

  /// File path: assets/svgs/Password-tips.svg
  SvgGenImage get passwordTips =>
      const SvgGenImage('assets/svgs/Password-tips.svg');

  /// File path: assets/svgs/auth-picture.svg
  SvgGenImage get authPicture =>
      const SvgGenImage('assets/svgs/auth-picture.svg');

  /// File path: assets/svgs/logo-with-word.svg
  SvgGenImage get logoWithWord =>
      const SvgGenImage('assets/svgs/logo-with-word.svg');

  /// File path: assets/svgs/onboarding-1.svg
  SvgGenImage get onboarding1 =>
      const SvgGenImage('assets/svgs/onboarding-1.svg');

  /// File path: assets/svgs/onboarding-2.svg
  SvgGenImage get onboarding2 =>
      const SvgGenImage('assets/svgs/onboarding-2.svg');

  /// File path: assets/svgs/onboarding-3.svg
  SvgGenImage get onboarding3 =>
      const SvgGenImage('assets/svgs/onboarding-3.svg');

  /// File path: assets/svgs/onboarding-4.svg
  SvgGenImage get onboarding4 =>
      const SvgGenImage('assets/svgs/onboarding-4.svg');

  /// File path: assets/svgs/white-logo-with-word.svg
  SvgGenImage get whiteLogoWithWord =>
      const SvgGenImage('assets/svgs/white-logo-with-word.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    allInOne,
    passEyeSlash,
    passEye,
    passwordTips,
    authPicture,
    logoWithWord,
    onboarding1,
    onboarding2,
    onboarding3,
    onboarding4,
    whiteLogoWithWord,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
