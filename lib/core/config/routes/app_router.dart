import 'package:flutter/material.dart';
import 'package:news/core/config/routes/pages_route_names.dart';
import 'package:news/modules/home.dart';
import 'package:news/modules/splash.dart';

abstract class AppRouter {
  static Route<dynamic> onGenerateRouter(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteNames.splash:
        return MaterialPageRoute(
          builder: (context) => Splash(),
          settings: settings,
        );
      case PagesRouteNames.home:
        return MaterialPageRoute(
          builder: (context) => Home(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Splash(),
          settings: settings,
        );
    }
  }
}
