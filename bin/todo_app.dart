import 'dart:io';
import 'package:todo_app/todo.dart';
import 'package:todo_app/todo_repositore.dart';

void main() {
  TodoRepositore todo = TodoRepositore();
  printMenu();
  while (true) {
    stdout.write('> ');
    String? input = stdin.readLineSync();
    if (input == null) {
      continue;
    }
    input = input.trim();
    if (input.isEmpty) {
      continue;
    }
    bool shouldExit = handeleCommand(repo, input);
    if (shouldExit) {
      break;
    }
  }
}

bool handeleCommand(repo, String input) {}

void printMenu() {
  print('Приложение TODO');
  print('Команды');
  print(' add <текст>     -добавить задачу');
  print(' list <текст     -показать список>');
  print(' done<id>        -отметить выполненной');
  print(' delete          -удалить задачу');
  print(' exit            - выход');
  print('');
}

void addCommand(TodoRepositore repo, String input) {
  if (input.length <= 4) {
    print('Ошибка: введите текст');
    return;
  }
  String title = input.substring(4).trim();
  repo.add(title);
  print('Задача добавлена');
}

void listCommand(TodoRepositore repo) {
  List<Todo> todos = repo.getAll();
  if (todos.isEmpty) {
    print('Список задач пуст');
    return;
  }
  for (var todo in todos){
    print(todo);
  }
}
