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

HRESULT loadImage(const std::wstring& inputFilePath,
                  DirectX::WIC_FLAGS wicFlags,
                  std::vector<DirectX::ScratchImage>& images)
{
    DirectX::ScratchImage inputImage{};
    const auto hr = LoadFromWICFile(inputFilePath.c_str(),
                                    wicFlags,
                                    nullptr,
                                    inputImage);

    images.emplace_back(std::move(inputImage));
    return hr;
}

HRESULT generateMipMaps(DirectX::TEX_FILTER_FLAGS texFilter,
                        std::vector<DirectX::ScratchImage>& images)
{
    DirectX::ScratchImage imageWithMipMaps{};
    const auto hr = GenerateMipMaps(images.back().GetImages(),
                                    images.back().GetImageCount(),
                                    images.back().GetMetadata(),
                                    texFilter,
                                    0,
                                    imageWithMipMaps);

    images.emplace_back(std::move(imageWithMipMaps));
    return hr;
}

HRESULT compress(DXGI_FORMAT format,
                 DirectX::TEX_FILTER_FLAGS texFilter,
                 DirectX::TEX_COMPRESS_FLAGS texCompress,
                 float threshold,
                 std::vector<DirectX::ScratchImage>& images)
{
    DirectX::ScratchImage imageCompressed{};
    const auto hr = DirectX::Compress(images.back().GetImages(),
                                      images.back().GetImageCount(),
                                      images.back().GetMetadata(),
                                      format,
                                      texCompress,
                                      threshold,
                                      imageCompressed);

    images.emplace_back(std::move(imageCompressed));
    return hr;
}

HRESULT saveImage(const std::wstring& outputFilePath,
                  DirectX::DDS_FLAGS ddsFlags,
                  const std::vector<DirectX::ScratchImage>& images)
{
    return SaveToDDSFile(images.back().GetImages(),
                         images.back().GetImageCount(),
                         images.back().GetMetadata(),
                         ddsFlags,
                         outputFilePath.c_str());
}

extern "C" __declspec(dllexport)
bool compressAndConvertToDds(const char* inputPath,
                             const char* outputPath,
                             const char* compressionAlgorithm,
                             const uint64_t wicFlagsMask,
                             const bool mipmapEnabled,
                             const uint64_t texFilterMask,
                             const bool compressionEnabled,
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

    std::vector<DirectX::ScratchImage> images{};

    if (FAILED(loadImage(inputPathAsWideString, wicFlags, images)))
        return false;

    if (FAILED(generateMipMaps(texFilter, images)))
        return false;

    if (FAILED(compress(format, texFilter, texCompress, static_cast<float>(threshold), images)))
        return false;

    if (FAILED(saveImage(outputPathAsWideString, ddsFlags, images)))
        return false;

    return true;
}

#endif //DIRECTXTEX_BRIDGE_LIBRARY_CPP
