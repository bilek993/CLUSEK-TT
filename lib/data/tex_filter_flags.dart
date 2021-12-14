class TexFilterFlags {
  TexFilterFlags._();

  static const wrapU = 0x1;
  static const wrapV = 0x2;
  static const wrapW = 0x4;
  static const mirrorU = 0x10;
  static const mirrorV = 0x20;
  static const mirrorW = 0x40;
  static const separateAlpha = 0x100;
  static const floatX2Bias = 0x200;
  static const RgbCopyRed = 0x1000;
  static const RgbCopyGreen = 0x2000;
  static const RgbCopyBlue = 0x4000;
  static const dither = 0x10000;
  static const ditherDiffusion = 0x20000;
  static const point = 0x100000;
  static const linear = 0x200000;
  static const cubic = 0x300000;
  static const box = 0x400000;
  static const fant = 0x400000;
  static const triangle = 0x500000;
  static const srgbIn = 0x1000000;
  static const srgbOut = 0x2000000;
}
