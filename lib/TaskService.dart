import 'package:riverpod/riverpod.dart';
import 'package:project_1/services/task_service.dart';

final taskServiceProvider = Provider((ref) => TaskService());
