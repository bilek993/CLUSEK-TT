#ifndef DIRECTXTEX_BRIDGE_LIBRARY_CPP
#define DIRECTXTEX_BRIDGE_LIBRARY_CPP

#include <DirectXTex.h>

DXGI_FORMAT convertStringToDxgiFormat(const std::string& value)
{
    if (value == "DXGI_FORMAT_BC1_TYPELESS")
        return DXGI_FORMAT::DXGI_FORMAT_BC1_TYPELESS;
    else if (value == "DXGI_FORMAT_BC1_UNORM")
        return DXGI_FORMAT::DXGI_FORMAT_BC1_UNORM;
    else if (value == "DXGI_FORMAT_BC1_UNORM_SRGB")
        return DXGI_FORMAT::DXGI_FORMAT_BC1_UNORM_SRGB;
    else if (value == "DXGI_FORMAT_BC2_TYPELESS")
        return DXGI_FORMAT::DXGI_FORMAT_BC2_TYPELESS;
    else if (value == "DXGI_FORMAT_BC2_UNORM")
        return DXGI_FORMAT::DXGI_FORMAT_BC2_UNORM;
    else if (value == "DXGI_FORMAT_BC2_UNORM_SRGB")
        return DXGI_FORMAT::DXGI_FORMAT_BC2_UNORM_SRGB;
    else if (value == "DXGI_FORMAT_BC3_TYPELESS")
        return DXGI_FORMAT::DXGI_FORMAT_BC3_TYPELESS;
    else if (value == "DXGI_FORMAT_BC3_UNORM")
        return DXGI_FORMAT::DXGI_FORMAT_BC3_UNORM;
    else if (value == "DXGI_FORMAT_BC3_UNORM_SRGB")
        return DXGI_FORMAT::DXGI_FORMAT_BC3_UNORM_SRGB;
    else if (value == "DXGI_FORMAT_BC4_TYPELESS")
        return DXGI_FORMAT::DXGI_FORMAT_BC4_TYPELESS;
    else if (value == "DXGI_FORMAT_BC4_UNORM")
        return DXGI_FORMAT::DXGI_FORMAT_BC4_UNORM;
    else if (value == "DXGI_FORMAT_BC4_SNORM")
        return DXGI_FORMAT::DXGI_FORMAT_BC4_SNORM;
    else if (value == "DXGI_FORMAT_BC5_TYPELESS")
        return DXGI_FORMAT::DXGI_FORMAT_BC5_TYPELESS;
    else if (value == "DXGI_FORMAT_BC5_UNORM")
        return DXGI_FORMAT::DXGI_FORMAT_BC5_UNORM;
    else if (value == "DXGI_FORMAT_BC5_SNORM")
        return DXGI_FORMAT::DXGI_FORMAT_BC5_SNORM;
    else if (value == "DXGI_FORMAT_BC6H_TYPELESS")
        return DXGI_FORMAT::DXGI_FORMAT_BC6H_TYPELESS;
    else if (value == "DXGI_FORMAT_BC6H_UF16")
        return DXGI_FORMAT::DXGI_FORMAT_BC6H_UF16;
    else if (value == "DXGI_FORMAT_BC6H_SF16")
        return DXGI_FORMAT::DXGI_FORMAT_BC6H_SF16;
    else if (value == "DXGI_FORMAT_BC7_TYPELESS")
        return DXGI_FORMAT::DXGI_FORMAT_BC7_TYPELESS;
    else if (value == "DXGI_FORMAT_BC7_UNORM")
        return DXGI_FORMAT::DXGI_FORMAT_BC7_UNORM;
    else if (value == "DXGI_FORMAT_BC7_UNORM_SRGB")
        return DXGI_FORMAT::DXGI_FORMAT_BC7_UNORM_SRGB;
    else
        return DXGI_FORMAT::DXGI_FORMAT_UNKNOWN;
}

extern "C" __declspec(dllexport)
bool compressAndConvertToDds(const char* inputPath,
                             const char* outputPath,
                             const char* compressionAlgorithm,
                             const uint64_t wicFlagsMask,
                             const uint64_t texFilterMask,
                             const uint64_t texCompressMask,
                             const uint64_t ddsFlagsMask,
                             const double threshold)
{
    std::string inputPathAsString(inputPath);
    std::string outputPathAsString(outputPath);
    std::string compressionAlgorithmAsString(compressionAlgorithm);

    std::wstring inputPathAsWideString(inputPathAsString.cbegin(), inputPathAsString.cend());
    std::wstring outputPathAsWideString(outputPathAsString.cbegin(), outputPathAsString.cend());

    const auto wicFlags = static_cast<DirectX::WIC_FLAGS>(wicFlagsMask);
    const auto texFilter = static_cast<DirectX::TEX_FILTER_FLAGS>(texFilterMask);
    const auto texCompress = static_cast<DirectX::TEX_COMPRESS_FLAGS>(texCompressMask);
    const auto ddsFlags = static_cast<DirectX::DDS_FLAGS>(ddsFlagsMask);

    const auto format = convertStringToDxgiFormat(compressionAlgorithm);

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
                           format,
                           texCompress,
                           static_cast<float>(threshold),
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
