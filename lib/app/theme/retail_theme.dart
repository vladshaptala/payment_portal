import 'package:flutter/material.dart';
import 'package:payment_portal/app/config/app_brand_config.dart';

ThemeData buildRetailTheme() {
  const primary = Color(0xFFE65100);
  const secondary = Color(0xFFFFC107);
  const surface = Color(0xFFFFF8F0);

  final colorScheme = ColorScheme.fromSeed(
    seedColor: primary,
    secondary: secondary,
    surface: surface,
    brightness: Brightness.light,
  );

  const config = AppBrandConfig(
    brandName: 'Retail Shop',
    flavor: AppFlavor.retail,
    showPromoBanner: true,
    promoMessage: '🎉 Use code SAVE10 — get 10 % off your next order!',
    showBillBreakdown: false,
    useHighDensityLayout: false,
    useFluidTransitions: true,
    cardBorderRadius: 20.0,
    buttonBorderRadius: 16.0,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
    transitionDuration: Duration(milliseconds: 450),
    transitionCurve: Curves.easeInOutCubicEmphasized,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    extensions: const [config],
    cardTheme: CardThemeData(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primaryContainer,
      foregroundColor: colorScheme.onPrimaryContainer,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: colorScheme.onPrimaryContainer,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(strokeWidth: 2.5),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
      },
    ),
  );
}
