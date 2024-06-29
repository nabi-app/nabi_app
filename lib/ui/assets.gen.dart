/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/icon_apple_login.svg
  SvgGenImage get iconAppleLogin =>
      const SvgGenImage('assets/svg/icon_apple_login.svg');

  /// File path: assets/svg/icon_arrow_left.svg
  SvgGenImage get iconArrowLeft =>
      const SvgGenImage('assets/svg/icon_arrow_left.svg');

  /// File path: assets/svg/icon_arrow_right.svg
  SvgGenImage get iconArrowRight =>
      const SvgGenImage('assets/svg/icon_arrow_right.svg');

  /// File path: assets/svg/icon_circle_add.svg
  SvgGenImage get iconCircleAdd =>
      const SvgGenImage('assets/svg/icon_circle_add.svg');

  /// File path: assets/svg/icon_circle_check.svg
  SvgGenImage get iconCircleCheck =>
      const SvgGenImage('assets/svg/icon_circle_check.svg');

  /// File path: assets/svg/icon_circle_empty.svg
  SvgGenImage get iconCircleEmpty =>
      const SvgGenImage('assets/svg/icon_circle_empty.svg');

  /// File path: assets/svg/icon_kakao_login.svg
  SvgGenImage get iconKakaoLogin =>
      const SvgGenImage('assets/svg/icon_kakao_login.svg');

  /// File path: assets/svg/icon_profile.svg
  SvgGenImage get iconProfile =>
      const SvgGenImage('assets/svg/icon_profile.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        iconAppleLogin,
        iconArrowLeft,
        iconArrowRight,
        iconCircleAdd,
        iconCircleCheck,
        iconCircleEmpty,
        iconKakaoLogin,
        iconProfile
      ];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsSvgGen svg = $AssetsSvgGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
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
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
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
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
