part of 'task_list_cubit.dart';

class TaskListState extends Equatable {
  const TaskListState({
    this.taskList = const [],
    this.taskItemCubit = const [],
  });

  final List<Task>? taskList;
  final List<TaskItemCubit>? taskItemCubit;

  TaskListState copyWith({
    List<Task>? taskList,
    List<TaskItemCubit>? taskItemCubit,
  }) {
    return TaskListState(
      taskList: taskList ?? this.taskList,
      taskItemCubit: taskItemCubit ?? this.taskItemCubit,
    );
  }

  @override
  List<Object?> get props => [taskList, taskItemCubit];
}
