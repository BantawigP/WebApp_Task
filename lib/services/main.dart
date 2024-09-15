import 'dart:io';
import 'package:riverpod/riverpod.dart';
import '../models/task.dart';
import 'package:project_1/TaskService.dart';

final container = ProviderContainer();

void main() {
  final taskService = container.read(taskServiceProvider);

  print('Welcome to the PM Task Manager!');
  while (true) {
    print('\n1. Add Task\n2. View Tasks\n3. Toggle Task Completion\n4. Delete Task\n5. Exit');
    stdout.write('Choose an option: ');
    final choice = stdin.readLineSync() ?? '';

    switch (choice) {
      case '1':
        stdout.write('Enter task ID: ');
        final id = stdin.readLineSync() ?? '';
        stdout.write('Enter task title: ');
        final title = stdin.readLineSync() ?? '';
        taskService.addTask(Task(id: id, title: title));
        break;

      case '2':
        print('View Tasks:');
        print('1. View All Tasks');
        print('2. View Completed Tasks');
        print('3. View Incomplete Tasks');
        stdout.write('Choose an option: ');
        final viewChoice = stdin.readLineSync() ?? '';

        switch (viewChoice) {
          case '1':
            print('All Tasks:');
            taskService.tasks.forEach((task) => print(task));
            break;

          case '2':
            print('Completed Tasks:');
            final completedTasks = taskService.tasks.where((task) => task.isCompleted).toList();
            if (completedTasks.isEmpty) {
              print('No completed tasks found.');
            } else {
              completedTasks.forEach((task) => print(task));
            }
            break;

          case '3':
            print('Incomplete Tasks:');
            final incompleteTasks = taskService.tasks.where((task) => !task.isCompleted).toList();
            if (incompleteTasks.isEmpty) {
              print('No incomplete tasks found.');
            } else {
              incompleteTasks.forEach((task) => print(task));
            }
            break;

          default:
            print('Invalid option. Please choose a valid option.');
        }
        break;

      case '3':
        stdout.write('Enter task ID to toggle completion: ');
        final id = stdin.readLineSync() ?? '';
        taskService.toggleTaskCompletion(id);
        break;

      case '4':
        stdout.write('Enter task ID to delete: ');
        final deleteId = stdin.readLineSync() ?? '';
        taskService.deleteTask(deleteId);
        break;

      case '5':
        print('Goodbye!');
        exit(0);
    }
  }
}


 