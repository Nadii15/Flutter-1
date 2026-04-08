import 'todo.dart';

class TodoRepositore {
  final List<Todo> _todos = [];

  List<Todo> getAll() {
    return _todos;
  }

  void add(String title) {
    if (title.trim().isEmpty) {
      throw ArgumentError('Название не может быть пустым');
    }
    Todo todo = Todo(title.trim());
    _todos.add(todo);
  }

  void complete(int id) {
    for (var todo in _todos) {
      if (todo.id == id) {
        todo.isDone = true;
        return;
      }
    }
     throw ArgumentError('Задача с айди не найдена');
  }
  void delete(int id){
        for (int i = 0 ; i<_todos.length; i++) {
          if (_todos[i].id == id) {
            _todos.removeAt(i);
            return;
      }
    }
     throw ArgumentError('Задача с айди не найдена');

  }
}
