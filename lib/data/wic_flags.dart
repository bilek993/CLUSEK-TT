class WicFlags {
  WicFlags._();

  static const int forceRgb = 0x1;
  static const int noX2Bias = 0x2;
  static const int no16Bpp = 0x4;
  static const int allowMono = 0x8;
  static const int allFrames = 0x10;
  static const int ignoreSrgb = 0x20;
  static const int forceSrgb = 0x40;
  static const int forceLinear = 0x80;
  static const int defaultSrgb = 0x100;
  static const int dither = 0x10000;
  static const int ditherDiffusion = 0x20000;
  static const int filterPoint = 0x100000;
  static const int filterLinear = 0x200000;
  static const int filterCubic = 0x300000;
  static const int filterFant = 0x400000;
}
