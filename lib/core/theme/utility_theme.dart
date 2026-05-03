import 'package:flutter/material.dart';
import 'package:payment_portal/core/config/app_config.dart';

ThemeData buildUtilityTheme() {
  const primary = Color(0xFF0D1B4B); // Navy
  const secondary = Color(0xFF546E7A); // Blue-grey/Slate

  final colorScheme = ColorScheme.fromSeed(
    seedColor: primary,
    secondary: secondary,
    brightness: Brightness.light,
  );

  const config = AppBrandConfig(
    brandName: 'Utility Pay',
    flavor: AppFlavor.utility,
    showPromoBanner: false,
    promoMessage: null,
    showBillBreakdown: true,
    useHighDensityLayout: true,
    useFluidTransitions: false,
    cardBorderRadius: 4.0,
    buttonBorderRadius: 4.0,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
    transitionDuration: Duration(milliseconds: 200),
    transitionCurve: Curves.easeOut,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    extensions: const [config],
    cardTheme: CardThemeData(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0D1B4B),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
    dividerTheme: const DividerThemeData(thickness: 1, space: 0),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      strokeWidth: 2.5,
      color: Colors.white,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
