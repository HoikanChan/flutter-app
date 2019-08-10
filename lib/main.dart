import 'package:flutter/material.dart';
import 'package:flutter_stetho/flutter_stetho.dart';
import './app/index.dart';

void main() {
  Stetho.initialize();
  runApp(App());
}
