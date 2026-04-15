import 'dart:io';
import '../lib/todo.dart';
import '../lib/todo_repositore.dart';
import 'package:ansicolor/ansicolor.dart';


final AnsiPen greenPen = AnsiPen()..green();
final AnsiPen redPen = AnsiPen()..red();
final AnsiPen bluePen = AnsiPen()..blue();
final AnsiPen yellowPen = AnsiPen()..yellow();

void main() {
  print(yellowPen("Консольное приложение TODO"));
  TodoRepositore repo = TodoRepositore();
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

bool handeleCommand(
  TodoRepositore repo,
  String input,
) {
  List<String> parts = input.split(" ");
  String command = parts[0].toLowerCase();
  try {
    switch (command) {
      case "add":
        addCommand(repo, input);
        break;
      case "list":
        listCommand(repo);
        break;
      case "done":
        doneCommand(repo, parts);
        break;
      case "delete":
        deleteCommand(repo, parts);
        break;
      case "exit":
        print("Выход из программы");
        return true;
      default:
        print("Неизвестная команда");
    }
  } catch (e) {
    print(redPen ("Ошибка $e"));
  }
  return false;
}

void deleteCommand(
  TodoRepositore repo,
  List<String> parts,
) {
  if (parts.length < 2) {
    print("Ошибка: укажте id");
    return;
  }
  int id = int.parse(parts[1]);
  repo.delete(id);
  print("Задача удалена");
}

void doneCommand(
  TodoRepositore repo,
  List<String> parts,
) {
  if (parts.length < 2) {
    print("Ошибка: укажите id");
    return;
  }
  int id = int.parse(parts[1]);
  repo.complete(id);
  print("Задача отмечена выполненной");
}

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

void addCommand(
  TodoRepositore repo,
  String input,
) {
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
  for (var todo in todos) {
    print(todo);
  }
}
