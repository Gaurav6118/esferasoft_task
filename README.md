Task Management App
This Flutter project is a simple task management app that allows users to manage tasks, view
details, and mark tasks as complete/incomplete. The app uses Bloc/Cubit for state management and
GoRouter for navigation.

Features
1) Task List Screen
Displays a list of tasks (title, description, and completion status).
Users can navigate to the "Add Task" screen using a Floating Action Button (FAB).

2) Add Task Screen
Users can input a task title and description, and mark the task as complete with a switch.
The new task is saved and added to the task list using Bloc/Cubit state management.

3) Task Details Screen
Clicking on a task navigates to the task details screen.
Full task information is displayed, including title, description, and status.
Users can toggle the task completion status (Complete/Incomplete) and navigate back to the task
list.

How to Add the Project into Android Studio
1) Clone the Repository
git clone https://github.com/Gaurav6118/esferasoft_task.git

2) Open the Project in Android Studio
Open Android Studio.
Click on "Open an existing Android Studio project" and navigate to the folder where you cloned the
project.

3) Install Dependencies
Run the following command in the terminal to install all dependencies:

flutter pub get
Run the Project

Select a device or emulator and click on the "Run" button in Android Studio.