import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:homeschool_planner/core/theme/app_theme.dart';
import 'package:homeschool_planner/core/router/app_router.dart';

void main() {
  runApp(
    const ProviderScope(
      child: HomeschoolPlannerApp(),
    ),
  );
}

class HomeschoolPlannerApp extends ConsumerWidget {
  const HomeschoolPlannerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    
    return MaterialApp.router(
      title: 'Homeschool Planner',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}