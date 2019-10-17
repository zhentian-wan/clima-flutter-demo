void main() {
  task1();
  task2();
  task3();
}

void task1() {
  String result = 'task1';
  print('Task 1 complete');
}

void task2() {
  Duration duration = Duration(seconds: 3);
  Future.delayed(duration, () {
    String result = 'task1';
    print('Task 2 complete');
  });
}

void task3() {
  String result = 'task2';
  print('Task 3 complete');
}
