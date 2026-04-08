void main() {
  print('Hello word');
  String name = 'Ренат';
  String? name2 = null;
  var count = 0;
  var title = "Учить Rust";
  var x = 5;
  // x = "hello";

  final id = 5;
  const appName = "TodoApp";
  print('$name,$name2,${count + 5},$title,$appName,$id,$x');

  List<String> tags = ['институт', 'дом'];
  Map<String, dynamic> data = {'key': 'value', 'num': 10};
  Set<int> numbera = {1, 2, 3};
  String greet(String name) => 'Hello $name';

  printTodo(title: "Купить еду");
  printTodo(title: "Сделать дз", done: true);
}

void printTodo({required String title, bool done = false}) {
  print('${done ? '+' : '-'} $title');
}

class Todo {
  final int id;
  String title;
  bool isDone;
  Todo({required this.id, required this.title, this.isDone = false});
}


