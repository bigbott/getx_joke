

class ViewModel {
  static final instance = ViewModel();
  int counter = 0;
  void increment() {
    counter++;
    print(counter);
  }
}