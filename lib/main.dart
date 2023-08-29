import 'package:deeplinkingflutter/GetData.dart';
import 'package:deeplinkingflutter/ProductCard.dart';
import 'package:deeplinkingflutter/ProductPage.dart';
import 'package:deeplinkingflutter/Profile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Home.dart';

void main() {
  runApp(const MyApp());
}

GoRouter _appRoute = GoRouter(routes: <RouteBase>[
  GoRoute(
    path: "/",
    builder: (BuildContext context, GoRouterState state) {
      return MyHomePage(
        title: "Home",
      );
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'products/:productid',
        builder: (BuildContext context, GoRouterState state) {
          return ProductPage(
            product: state.pathParameters["productid"],
          );
        },
      ),
    ],
  ),
  GoRoute(
      path: "/profile",
      builder: (BuildContext context, GoRouterState state) {
        return Profile();
      })
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
