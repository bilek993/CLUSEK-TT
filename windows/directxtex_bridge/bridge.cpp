#ifndef DIRECTXTEX_BRIDGE_LIBRARY_CPP
#define DIRECTXTEX_BRIDGE_LIBRARY_CPP

#include <DirectXTex.h>

extern "C" __declspec(dllexport)
bool compressAndConvertToDds(const char* inputPath,
                             const char* outputPath,
                             const char* compressionAlgorithm,
                             const uint64_t wicFlagsMask,
                             const uint64_t texFilterMask,
                             const uint64_t texCompressMask,
                             const uint64_t ddsFlagsMask)
{
    std::string inputPathAsString(inputPath);
    std::string outputPathAsString(outputPath);
    std::string compressionAlgorithmAsString(compressionAlgorithm);

    std::wstring inputPathAsWideString(inputPathAsString.cbegin(), inputPathAsString.cend());
    std::wstring outputPathAsWideString(outputPathAsString.cbegin(), outputPathAsString.cend());
    std::wstring compressionAlgorithmAsWideString(compressionAlgorithmAsString.cbegin(),
                                                  compressionAlgorithmAsString.cend());

    const auto wicFlags = static_cast<DirectX::WIC_FLAGS>(wicFlagsMask);
    const auto texFilter = static_cast<DirectX::TEX_FILTER_FLAGS>(texFilterMask);
    const auto texCompress = static_cast<DirectX::TEX_COMPRESS_FLAGS>(texCompressMask);
    const auto ddsFlags = static_cast<DirectX::DDS_FLAGS>(ddsFlagsMask);

    DirectX::ScratchImage inputImage;
    DirectX::ScratchImage inputImageWithMipMaps;
    DirectX::ScratchImage outputImage;

    HRESULT hr = LoadFromWICFile(inputPathAsWideString.c_str(),
                                 wicFlags,
                                 nullptr,
                                 inputImage);
    if (FAILED(hr))
        return false;

    hr = GenerateMipMaps(inputImage.GetImages(),
                         inputImage.GetImageCount(),
                         inputImage.GetMetadata(),
                         texFilter,
                         0,
                         inputImageWithMipMaps);
    if (FAILED(hr))
        return false;

    hr = DirectX::Compress(inputImageWithMipMaps.GetImages(),
                           inputImageWithMipMaps.GetImageCount(),
                           inputImageWithMipMaps.GetMetadata(),
                           DXGI_FORMAT::DXGI_FORMAT_BC7_UNORM, // TODO: Change this
                           texCompress,
                           0.5F,  // TODO: Change this
                           outputImage);
    if (FAILED(hr))
        return false;

    hr = SaveToDDSFile(outputImage.GetImages(),
                       outputImage.GetImageCount(),
                       outputImage.GetMetadata(),
                       ddsFlags,
                       outputPathAsWideString.c_str());
    if (FAILED(hr))
        return false;

    return true;
}

#endif //DIRECTXTEX_BRIDGE_LIBRARY_CPP
