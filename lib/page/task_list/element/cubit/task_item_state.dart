part of 'task_item_cubit.dart';

class TaskItemState extends Equatable {
  const TaskItemState({
    this.task,
    this.isLiked = false,
  });

  final Task? task;
  final bool? isLiked;

  TaskItemState copyWith({
    Task? task,
    bool? isLiked,
  }) {
    return TaskItemState(
      task: task ?? this.task,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  @override
  List<Object?> get props => [task, isLiked];
}
