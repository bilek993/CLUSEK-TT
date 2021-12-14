extension IntegerBitwiseOperationsExtensions on int {
  bool checkFlag(int flag) {
    return this & flag > 0;
  }

  int addFlag(int flag) {
    return this | flag;
  }

  int removeFlag(int flag) {
    return this & (~flag);
  }

  int flipFlag(int flag) {
    return this ^ flag;
  }

  int clearAllFlags() {
    return 0;
  }
}
