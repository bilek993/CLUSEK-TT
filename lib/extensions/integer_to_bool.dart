extension IntegerToBool on int {
  bool nativeIntegerToBool() {
    switch (this) {
      case 0:
        return false;
      case 1:
        return true;
      default:
        throw Exception(
            'Incorrect integer value has been passed! Value $this cannot be converted into bool!');
    }
  }
}
