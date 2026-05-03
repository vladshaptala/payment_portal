import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:payment_portal/core/theme/retail_theme.dart';
import 'package:payment_portal/features/payment/views/payment_confirmation_view.dart';

void main() {
  runApp(const ProviderScope(child: _RetailApp()));
}

class _RetailApp extends StatelessWidget {
  const _RetailApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retail Shop Pay',
      theme: buildRetailTheme(),
      debugShowCheckedModeBanner: false,
      home: const PaymentConfirmationScreen(),
    );
  }
}
