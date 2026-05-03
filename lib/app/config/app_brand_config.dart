import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';

enum AppFlavor { retail, utility }

class AppBrandConfig extends ThemeExtension<AppBrandConfig> {
  const AppBrandConfig({
    required this.brandName,
    required this.flavor,
    required this.showPromoBanner,
    required this.showBillBreakdown,
    required this.useHighDensityLayout,
    required this.useFluidTransitions,
    required this.cardBorderRadius,
    required this.buttonBorderRadius,
    required this.contentPadding,
    required this.transitionDuration,
    required this.transitionCurve,
    this.promoMessage,
  });

  final String brandName;
  final AppFlavor flavor;

  // Feature flags
  final bool showPromoBanner;
  final String? promoMessage;
  final bool showBillBreakdown;
  final bool useHighDensityLayout;
  final bool useFluidTransitions;

  // UI tokens
  final double cardBorderRadius;
  final double buttonBorderRadius;
  final EdgeInsets contentPadding;
  final Duration transitionDuration;
  final Curve transitionCurve;

  // Conveniences
  SizedBox get verticalGap =>
      SizedBox(height: useHighDensityLayout ? 8.0 : 16.0);

  BorderRadius get cardRadius => BorderRadius.circular(cardBorderRadius);

  static AppBrandConfig of(BuildContext context) =>
      Theme.of(context).extension<AppBrandConfig>()!;

  @override
  AppBrandConfig copyWith({
    String? brandName,
    AppFlavor? flavor,
    bool? showPromoBanner,
    String? promoMessage,
    bool? showBillBreakdown,
    bool? useHighDensityLayout,
    bool? useFluidTransitions,
    double? cardBorderRadius,
    double? buttonBorderRadius,
    EdgeInsets? contentPadding,
    Duration? transitionDuration,
    Curve? transitionCurve,
  }) {
    return AppBrandConfig(
      brandName: brandName ?? this.brandName,
      flavor: flavor ?? this.flavor,
      showPromoBanner: showPromoBanner ?? this.showPromoBanner,
      promoMessage: promoMessage ?? this.promoMessage,
      showBillBreakdown: showBillBreakdown ?? this.showBillBreakdown,
      useHighDensityLayout: useHighDensityLayout ?? this.useHighDensityLayout,
      useFluidTransitions: useFluidTransitions ?? this.useFluidTransitions,
      cardBorderRadius: cardBorderRadius ?? this.cardBorderRadius,
      buttonBorderRadius: buttonBorderRadius ?? this.buttonBorderRadius,
      contentPadding: contentPadding ?? this.contentPadding,
      transitionDuration: transitionDuration ?? this.transitionDuration,
      transitionCurve: transitionCurve ?? this.transitionCurve,
    );
  }

  @override
  AppBrandConfig lerp(ThemeExtension<AppBrandConfig>? other, double t) {
    if (other is! AppBrandConfig) return this;
    return AppBrandConfig(
      brandName: t < 0.5 ? brandName : other.brandName,
      flavor: t < 0.5 ? flavor : other.flavor,
      showPromoBanner: t < 0.5 ? showPromoBanner : other.showPromoBanner,
      promoMessage: t < 0.5 ? promoMessage : other.promoMessage,
      showBillBreakdown: t < 0.5 ? showBillBreakdown : other.showBillBreakdown,
      useHighDensityLayout: t < 0.5
          ? useHighDensityLayout
          : other.useHighDensityLayout,
      useFluidTransitions: t < 0.5
          ? useFluidTransitions
          : other.useFluidTransitions,
      cardBorderRadius: lerpDouble(
        cardBorderRadius,
        other.cardBorderRadius,
        t,
      )!,
      buttonBorderRadius: lerpDouble(
        buttonBorderRadius,
        other.buttonBorderRadius,
        t,
      )!,
      contentPadding: EdgeInsets.lerp(contentPadding, other.contentPadding, t)!,
      transitionDuration: t < 0.5
          ? transitionDuration
          : other.transitionDuration,
      transitionCurve: t < 0.5 ? transitionCurve : other.transitionCurve,
    );
  }
}
