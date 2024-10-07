import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:formz/formz.dart';
import 'package:task/help/app_config.dart' as config;
import 'package:task/help/route_arugument.dart';
import 'package:task/page/add_task/cubit/add_task_cubit.dart';
import 'package:task/page/task_list/cubit/task_list_cubit.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, this.routeArguments});

  final RouteArguments? routeArguments;

  // Initialize page in the router class
  static Route route({RouteArguments? routeArguments}) {
    return MaterialPageRoute(
        builder: (_) => BlocProvider(
            create: (context) {
              return AddTaskCubit();
            },
            child: AddTaskScreen(routeArguments: routeArguments)));
  }

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.routeArguments!.task != null) {
      titleController.text = widget.routeArguments!.task!.title.toString();
      descriptionController.text =
          widget.routeArguments!.task!.description.toString();

      context
          .read<AddTaskCubit>()
          .onTitleChanged(value: widget.routeArguments!.task!.title.toString());

      context.read<AddTaskCubit>().onDescriptionChanged(
          value: widget.routeArguments!.task!.description.toString());

      context.read<AddTaskCubit>().changeTaskStatus(
          value: widget.routeArguments!.task!.isCompleted == 1 ? true : false);
    }

    titleController.addListener(() {
      context
          .read<AddTaskCubit>()
          .onTitleChanged(value: titleController.text.trim().toString());
    });

    descriptionController.addListener(() {
      context.read<AddTaskCubit>().onDescriptionChanged(
          value: descriptionController.text.trim().toString());
    });

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, AddTaskState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            leading: widget.routeArguments!.initial!
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_outlined)),
            centerTitle: widget.routeArguments!.initial! ? true : false,
            title: const Text('Add Task'),
          ),
          body: Padding(
            padding: EdgeInsets.all(config.AppConfig(context).appWidth(5)),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    errorText:
                        state.title!.invalid ? "Please Enter Title" : null,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.yellow,
                          width: config.AppConfig(context).appWidth(0.2)),
                    ),
                  ),
                ),
                SizedBox(
                  height: config.AppConfig(context).appHeight(2.0),
                ),
                TextField(
                  controller: descriptionController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    errorText: state.description!.invalid
                        ? "Please Enter Description"
                        : null,
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.yellow,
                          width: config.AppConfig(context).appWidth(0.2)),
                    ),
                  ),
                ),
                SizedBox(
                  height: config.AppConfig(context).appHeight(2.0),
                ),
                SwitchListTile(
                  title: const Text('Completed'),
                  value: state.taskStatus!,
                  activeColor: Colors.green,
                  activeTrackColor: Colors.green.shade200,
                  onChanged: (value) {
                    context.read<AddTaskCubit>().changeTaskStatus();
                  },
                ),
                SizedBox(
                  height: config.AppConfig(context).appHeight(2.0),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      state.status!.isInvalid
                          ? Colors.grey
                          : config.AppColors().accentColor(1),
                    ),
                  ),
                  onPressed: () async {
                    if (state.status!.isValidated) {
                      if (widget.routeArguments!.task != null) {
                        context.read<AddTaskCubit>().updateTask(id: widget.routeArguments!.task!.id!);
                      } else{
                        context.read<AddTaskCubit>().addTask();
                      }
                      context.read<TaskListCubit>().loadDBTask();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/TaskList', (route) => false);
                    } else {
                      // Show a toast message
                      Fluttertoast.showToast(
                        msg: "Please enter title",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                  },
                  child: const Text(
                    'Save Task',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
