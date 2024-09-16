import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visitor_pattern_app/domain/providers/insurance_notifier.dart';
import 'package:visitor_pattern_app/ui/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => InsuranceNotifier(),
        )
      ],
      child: const MaterialApp(
          title: 'Seguros App',
          debugShowCheckedModeBanner: false,
          home: HomeScreen()),
    );
  }
}
