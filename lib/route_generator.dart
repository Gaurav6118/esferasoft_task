import 'package:flutter/material.dart';
import 'package:task/help/route_arugument.dart';
import 'package:task/page/add_task/add_task_screen.dart';
import 'package:task/page/splash.dart';
import 'package:task/page/task_list/task_list_screen.dart';

// This class is using for set route
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    debugPrint(settings.name.toString());
    switch (settings.name) {
      case '/Splash':
        return MaterialPageRoute<void>(builder: (_) => const SplashPage());

      case '/TaskList':
        return TaskListScreen.route();

      case '/AddTaskList':
        return AddTaskScreen.route(routeArguments: args as RouteArguments);

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute<void>(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Route Error')))));
    }
  }
}
