class TexCompressFlags {
  TexCompressFlags._();

  static const rgbDither = 0x10000;
  static const aDither = 0x20000;
  static const dither = 0x30000;
  static const uniform = 0x40000;
  static const bc7Use3Subsets = 0x80000;
  static const bc7Quick = 0x100000;
  static const srgbIn = 0x1000000;
  static const srgbOut = 0x2000000;
  static const parallel = 0x10000000;
}
