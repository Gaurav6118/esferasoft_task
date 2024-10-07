import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/database/dao/db_task.dart';
import 'package:task/model/task_model.dart';
import 'package:task/page/task_list/element/cubit/task_item_cubit.dart';

part 'task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit() : super(const TaskListState());

  final DBTask dbTask = DBTask();

  Future<bool> loadDBTask() async {
    final tasks = await dbTask.getTasks();

    List<TaskItemCubit> cubit = [];

    for (var element in tasks) {
      cubit.add(TaskItemCubit(element));
    }

    emit(state.copyWith(taskItemCubit: cubit));

    return true;
  }
}
