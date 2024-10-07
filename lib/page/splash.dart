import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/help/app_config.dart' as config;
import 'package:task/help/route_arugument.dart';
import 'package:task/page/task_list/cubit/task_list_cubit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {

    context.read<TaskListCubit>().loadDBTask();

    Timer(const Duration(seconds: 3), () {
      context.read<TaskListCubit>().state.taskItemCubit!.isNotEmpty
          ? Navigator.of(context).pushNamed('/TaskList')
          : Navigator.of(context).pushNamed('/AddTaskList',
              arguments: RouteArguments(initial: true));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: config.AppColors().accentColor(1),
      body: SizedBox(
        height: config.AppConfig(context).appHeight(100),
        child: Center(
          child: Image.asset(
            'assets/img/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
