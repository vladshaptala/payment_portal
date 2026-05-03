import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_portal/app/theme/utility_theme.dart';
import 'package:payment_portal/features/payment/presentation/payment_screen.dart';

void main() {
  runApp(const ProviderScope(child: _UtilityApp()));
}

class _UtilityApp extends StatelessWidget {
  const _UtilityApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utility Pay',
      theme: buildUtilityTheme(),
      debugShowCheckedModeBanner: false,
      home: const PaymentScreen(),
    );
  }
}
