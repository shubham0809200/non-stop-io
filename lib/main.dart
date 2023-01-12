import 'package:flutter/material.dart';
import 'package:non_stop_io/core/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: RouteGenerator().router.routeInformationParser,
      routerDelegate: RouteGenerator().router.routerDelegate,
    );
  }
}
