class CounterController {
  int increment(int current) {
    return ++current;
  }

  int decrement(int current) {
    return --current;
  }

  int reset() {
    return 0;
  }
}
