import 'package:flutter/material.dart';
import 'package:news/core/config/routes/pages_route_names.dart';
import 'package:news/core/gen/assets.gen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () => Navigator.pushNamed(context, PagesRouteNames.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Assets.images.splashImg.image(fit: BoxFit.cover));
  }
}
