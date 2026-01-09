import 'package:flutter/material.dart';
import "package:artspire/router.dart";
import "package:flutter_stripe/flutter_stripe.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = 'pk_test_51SnS8vCZrLJ4YaKM0l6oOo2bZLiOCx2BJpOAIkxlNOJ6JG701I3lwDf7qiaQc4GE3DlNSIt17G9nL6ORjOXGJLPS00sMGsB8tM';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
