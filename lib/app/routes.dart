import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:saas_app/app/screens/Layout.dart';
import 'package:saas_app/app/screens/login.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomeScreen();
});

var appDetailRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new LoginScreen();
});

class AppRoutes {
  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ROUTE WAS NOT FOUND !!!');
    });
    router.define("/", handler: rootHandler);
    router.define("login", handler: appDetailRouteHandler);
  }
}
