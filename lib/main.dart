import 'package:flutter/material.dart';
import 'package:task/app.dart';
import 'package:task/database/db_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DBHelper();
  runApp(const App());
}

