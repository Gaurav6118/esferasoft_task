import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/model/task_model.dart';

part 'task_item_state.dart';

class TaskItemCubit extends Cubit<TaskItemState> {
  TaskItemCubit(Task element) :
        super(TaskItemState(task: element));
}
