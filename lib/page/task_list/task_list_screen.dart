import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/help/app_config.dart' as config;
import 'package:task/help/route_arugument.dart';
import 'package:task/page/task_list/cubit/task_list_cubit.dart';
import 'package:task/page/task_list/element/item_list.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const TaskListScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskListCubit, TaskListState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            leading: const SizedBox(),
            centerTitle: true,
            title: const Text('Task List'),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/AddTaskList',
                  arguments: RouteArguments(initial: false));
            },
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          body: state.taskItemCubit!.isEmpty
              ? const Center(child: Text('No tasks available'))
              : ListView.separated(
                  itemCount: state.taskItemCubit!.length,
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.all(config.AppConfig(context).appHeight(1)),
                  separatorBuilder: (c, i) {
                    return SizedBox(
                      height: config.AppConfig(context).appHeight(1.5),
                    );
                  },
                  itemBuilder: (context, index) {
                    return BlocProvider.value(
                      value: state.taskItemCubit![index],
                      child: ItemList(index: index),
                    );
                  },
                ),
        );
      },
    );
  }
}
