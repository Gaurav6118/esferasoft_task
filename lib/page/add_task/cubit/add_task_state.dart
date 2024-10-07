part of 'add_task_cubit.dart';

class AddTaskState extends Equatable {
  const AddTaskState({
    this.title = const Validator.pure(),
    this.description = const Validator.pure(),
    this.taskStatus = false,
    this.status = FormzStatus.pure,
  });

  final Validator? title;
  final Validator? description;
  final bool? taskStatus;
  final FormzStatus? status;


  AddTaskState copyWith({
    Validator? title,
    Validator? description,
    bool? taskStatus,
    FormzStatus? status
  }) {
    return AddTaskState(
      title: title ?? this.title,
      description: description ?? this.description,
      taskStatus: taskStatus ?? this.taskStatus,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [title, description, taskStatus, status];
}