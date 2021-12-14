class DdsFlags {
  DdsFlags._();

  static const legacyDword = 0x1;
  static const noLegacyDword = 0x2;
  static const nor10b10g10a2FixUp = 0x4;
  static const forceRgb = 0x8;
  static const no16bpp = 0x10;
  static const expandLuminance = 0x20;
  static const badDxtnTails = 0x40;
  static const forceDx10Ext = 0x10000;
  static const forceDx10ExtMisc2 = 0x20000;
  static const forceDx9Legacy = 0x40000;
  static const allowLargeFiles = 0x1000000;
}
