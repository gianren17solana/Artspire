import 'package:flutter/material.dart';
import "package:flutter_stripe/flutter_stripe.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentService {
  static Future<Map<String, dynamic>?> createPaymentIntent(String amount, String currency) async {
    try {
      final body = {
        'amount': amount,
        'currency': currency,
      };

      final response = await http.post(
        Uri.parse('https://artspire-seven.vercel.app/api/payment'),
        body: body,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      );
      return jsonDecode(response.body);
    } catch (err) {
      print(err);
      return null;
    }
  }

  static Future<void> makePayment(BuildContext context, double amount) async {
    try {
      // Convert amount to cents (Stripe expects smallest currency unit)
      final amountInCents = (amount * 100).toInt().toString();
      final paymentIntentData = await createPaymentIntent(amountInCents, 'PHP');
      
      if (paymentIntentData == null || paymentIntentData['client_secret'] == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Failed to create payment intent")),
        );
        return;
      }

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentData['client_secret'],
          style: ThemeMode.light,
          customFlow: false,
          merchantDisplayName: 'Artspire',
        ),
      );
      
      await displayPaymentSheet(context);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment error: $e")),
      );
    }
  }

  static Future<void> displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Paid successfully!")),
      );
    } on StripeException catch (e) {
      print("Stripe error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment cancelled")),
      );
    }
  }
}
