import 'package:flutter/material.dart';
import 'package:news/core/config/routes/app_router.dart';
import 'package:news/core/config/routes/pages_route_names.dart';
import 'package:news/core/config/theme/theme_manager.dart';

void main() {
  runApp(News());
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PagesRouteNames.splash,
      onGenerateRoute: AppRouter.onGenerateRouter,
      theme: ThemeManager.getLightTheme(),
    );
  }
}
