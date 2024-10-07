import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/help/route_arugument.dart';
import 'package:task/page/task_list/element/cubit/task_item_cubit.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, this.index});

  final int? index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskItemCubit, TaskItemState>(
      builder: (context, state) {
        return Card(
          child: ListTile(
            title: Text(state.task!.title ?? ''),
            subtitle: Text(state.task!.description ?? ''),
            trailing: Icon(
              state.task!.isCompleted == 1 ? Icons.check : Icons.pending,
              color: state.task!.isCompleted == 1
                  ? Colors.green
                  : Colors.yellow.shade900,
            ),
            onTap: () {
              Navigator.of(context).pushNamed('/AddTaskList',
                  arguments: RouteArguments(initial: false, task: state.task!));
            },
          ),
        );
      },
    );
  }
}
