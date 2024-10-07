import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:formz/formz.dart';
import 'package:task/database/dao/db_task.dart';
import 'package:task/model/task_model.dart';
import 'package:task/model/validator.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(const AddTaskState());
  final DBTask dbTask = DBTask();

  void onTitleChanged({String? value}) {
    emit(state.copyWith(
        title: Validator.dirty(value.toString()),
        status: Formz.validate([
          Validator.dirty(value.toString()),
          state.description!,
        ])));
  }

  void onDescriptionChanged({String? value}) {
    emit(state.copyWith(
        description: Validator.dirty(value.toString()),
        status: Formz.validate([
          Validator.dirty(value.toString()),
          state.title!,
        ])));
  }

  changeTaskStatus({bool? value}) {
    emit(state.copyWith(taskStatus: value ?? !state.taskStatus!));
  }

  void addTask() async {
    final task = Task(
      title: state.title!.value.toString(),
      description: state.description!.value.toString(),
      isCompleted: state.taskStatus! ? 1 : 0,
    );

    await dbTask.insertTask(task);

    Fluttertoast.showToast(
      msg: "Task saved successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void updateTask({int? id}) async {
    final task = Task(
      id: id,
      title: state.title!.value.toString(),
      description: state.description!.value.toString(),
      isCompleted: state.taskStatus! ? 1 : 0,
    );
    await dbTask.updateTask(task);

    Fluttertoast.showToast(
      msg: "Task updated successfully",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
