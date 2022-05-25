import 'package:bloc_test/bloc_test.dart';
import 'package:clusek_tt/cubit/core/core_cubit.dart';
import 'package:clusek_tt/data/compression_algorithms.dart';
import 'package:clusek_tt/data/dds_flags.dart';
import 'package:clusek_tt/data/tex_compress_flags.dart';
import 'package:clusek_tt/data/tex_filter_flags.dart';
import 'package:clusek_tt/data/wic_flags.dart';
import 'package:clusek_tt/services/directxtex_bridge_service.dart';
import 'package:clusek_tt/services/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import './core_cubit_test.mocks.dart';

@GenerateMocks([DirectxtexBridgeService])
@GenerateMocks([Logger])
void main() {
  late final DirectxtexBridgeService _mockedDirectxtexBridgeService;

  setUpAll(() {
    _mockedDirectxtexBridgeService = MockDirectxtexBridgeService();

    locator.registerLazySingleton<Logger>(() => MockLogger());
    locator.registerLazySingleton<DirectxtexBridgeService>(
        () => _mockedDirectxtexBridgeService);
  });

  blocTest(
    "'changePage' should change to proper page",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.changePage(12),
    expect: () => [
      const CoreState.initial(selectedSubpage: 12),
    ],
  );

  blocTest(
    "'changePage' should change page to `-1` if negative value is passed",
    build: () => CoreCubit(),
    seed: () => const CoreState.initial(selectedSubpage: 12),
    act: (CoreCubit cubit) => cubit.changePage(-1),
    expect: () => [
      const CoreState.initial(selectedSubpage: 0),
    ],
  );

  blocTest(
    "'setAlbedoPreset' should set state to proper values",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setAlbedoPreset(),
    expect: () => [
      const CoreState.initial(
        selectedAlgorithm: CompressionAlgorithms.bc1UnormSrgb,
        texCompressMask: TexCompressFlags.srgbIn,
      ),
    ],
  );

  blocTest(
    "'setEmissivePreset' should set state to proper values",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setEmissivePreset(),
    expect: () => [
      const CoreState.initial(
        selectedAlgorithm: CompressionAlgorithms.bc1UnormSrgb,
        texCompressMask: TexCompressFlags.srgbIn,
      ),
    ],
  );

  blocTest(
    "'setCombinedDataPreset' should set state to proper values",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setCombinedDataPreset(),
    expect: () => [
      const CoreState.initial(
        selectedAlgorithm: CompressionAlgorithms.bc7Unorm,
        texCompressMask: TexCompressFlags.parallel,
      ),
    ],
  );

  blocTest(
    "'setNormalPreset' should set state to proper values",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setNormalPreset(),
    expect: () => [
      const CoreState.initial(
        selectedAlgorithm: CompressionAlgorithms.bc5Unorm,
        texFilterMask: TexFilterFlags.rgbCopyRed | TexFilterFlags.rgbCopyGreen,
      ),
    ],
  );

  blocTest(
    "'setInputFilePath' should set input path, if automatic file path is disabled",
    build: () => CoreCubit(),
    seed: () => const CoreState.initial(automaticOutputFilePath: false),
    act: (CoreCubit cubit) =>
        cubit.setInputFilePath('C:/example_dir/example_file.png'),
    expect: () => [
      const CoreState.initial(
        inputFilePath: 'C:/example_dir/example_file.png',
        automaticOutputFilePath: false,
      ),
    ],
  );

  blocTest(
    "'setInputFilePath' should set input path and output path (.png -> .dds), if automatic file path is enabled",
    build: () => CoreCubit(),
    seed: () => const CoreState.initial(automaticOutputFilePath: true),
    act: (CoreCubit cubit) =>
        cubit.setInputFilePath('C:/example_dir/example_file.png'),
    expect: () => [
      const CoreState.initial(
        inputFilePath: 'C:/example_dir/example_file.png',
        outputFilePath: 'C:/example_dir/example_file.dds',
        automaticOutputFilePath: true,
      ),
    ],
  );

  blocTest(
    "'setOutputFilePath' should set proper output path",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) =>
        cubit.setOutputFilePath('C:/example_dir/example_file.dds'),
    expect: () => [
      const CoreState.initial(
          outputFilePath: 'C:/example_dir/example_file.dds'),
    ],
  );

  blocTest(
    "'setAutomaticOutputFilePath' should properly generate output path, based on input path, when enabling",
    build: () => CoreCubit(),
    seed: () => const CoreState.initial(
      automaticOutputFilePath: false,
      inputFilePath: 'C:/example_dir/example_file.png',
    ),
    act: (CoreCubit cubit) => cubit.setAutomaticOutputFilePath(true),
    expect: () => [
      const CoreState.initial(
        inputFilePath: 'C:/example_dir/example_file.png',
        outputFilePath: 'C:/example_dir/example_file.dds',
        automaticOutputFilePath: true,
      ),
    ],
  );

  blocTest(
    "'setAlgorithm' should change algorithm, if proper value is passed",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) =>
        cubit.setAlgorithm(CompressionAlgorithms.bc2UnormSrgb),
    expect: () => [
      const CoreState.initial(
          selectedAlgorithm: CompressionAlgorithms.bc2UnormSrgb),
    ],
  );

  blocTest(
    "'setAlgorithm' should not change algorithm, if incorrect value is passed",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setAlgorithm('WTF?!'),
    expect: () => [],
  );

  blocTest(
    "'setThreshold' should parse string and set threshold as double in state",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setThreshold('0.15'),
    expect: () => [
      const CoreState.initial(threshold: 0.15),
    ],
  );

  blocTest(
    "'setThreshold' should not set threshold if string is not parsable",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setThreshold('xyz'),
    expect: () => [],
  );

  blocTest(
    "'setWicFlagsMask' should set mask to proper value",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setWicFlagsMask(WicFlags.allowMono),
    expect: () => [
      const CoreState.initial(wicFlagsMask: WicFlags.allowMono),
    ],
  );

  blocTest(
    "'setMipmapEnabled' should set enabled status to proper value",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setMipmapEnabled(true),
    expect: () => [
      const CoreState.initial(mipmapEnabled: true),
    ],
  );

  blocTest(
    "'setTexFilterMask' should set mask to proper value",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setTexFilterMask(TexFilterFlags.box),
    expect: () => [
      const CoreState.initial(texFilterMask: TexFilterFlags.box),
    ],
  );

  blocTest(
    "'setCompressionEnabled' should set enabled status to proper value",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setCompressionEnabled(true),
    expect: () => [
      const CoreState.initial(compressionEnabled: true),
    ],
  );

  blocTest(
    "'setTexCompressMask' should set mask to proper value",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) =>
        cubit.setTexCompressMask(TexCompressFlags.bc7Quick),
    expect: () => [
      const CoreState.initial(texCompressMask: TexCompressFlags.bc7Quick),
    ],
  );

  blocTest(
    "'setDdsFlagsMask' should set mask to proper value",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.setDdsFlagsMask(DdsFlags.badDxtnTails),
    expect: () => [
      const CoreState.initial(ddsFlagsMask: DdsFlags.badDxtnTails),
    ],
  );

  blocTest(
    "'convert' in success scenario should: 1) Set state to loading; 2) Call the service; 3) Disable loading in the state",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.convert(),
    setUp: () {
      when(_mockedDirectxtexBridgeService.compressAndConvertToDds(
              '', '', 'DXGI_FORMAT_BC7_UNORM', 0, 0, 0, 0, 0.5))
          .thenReturn(true);
    },
    verify: (cubit) => verify(
            _mockedDirectxtexBridgeService.compressAndConvertToDds(
                '', '', 'DXGI_FORMAT_BC7_UNORM', 0, 0, 0, 0, 0.5))
        .called(1),
    expect: () => [
      const CoreState.initial(loadingInProgress: true),
      const CoreState.initial(loadingInProgress: false),
    ],
  );

  blocTest(
    "'convert' in error scenario should: 1) Set state to loading; 2) Call the service; 3) Set error flag in state 4) Disable loading and error flag in the state",
    build: () => CoreCubit(),
    act: (CoreCubit cubit) => cubit.convert(),
    setUp: () {
      when(_mockedDirectxtexBridgeService.compressAndConvertToDds(
        '',
        '',
        'DXGI_FORMAT_BC7_UNORM',
        0,
        0,
        0,
        0,
        0.5,
      )).thenReturn(false);
    },
    verify: (cubit) => verify(
            _mockedDirectxtexBridgeService.compressAndConvertToDds(
                '', '', 'DXGI_FORMAT_BC7_UNORM', 0, 0, 0, 0, 0.5))
        .called(1),
    expect: () => [
      const CoreState.initial(loadingInProgress: true),
      const CoreState.initial(
        errorReportedFromNative: true,
        loadingInProgress: true,
      ),
      const CoreState.initial(
        errorReportedFromNative: false,
        loadingInProgress: false,
      ),
    ],
  );
}
