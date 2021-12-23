extension IntegerBitwiseOperationsExtension on int {
  bool checkFlag(int flag) {
    return this & flag == flag;
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
