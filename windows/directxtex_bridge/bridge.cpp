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
    std::wstring compressionAlgorithmAsWideString(compressionAlgorithmAsString.cbegin(), compressionAlgorithmAsString.cend());

    DirectX::ScratchImage image;
    HRESULT hr = LoadFromWICFile( inputPathAsWideString.c_str(), DirectX::WIC_FLAGS_NONE, nullptr, image );

    hr = SaveToDDSFile(image.GetImages(),
                       image.GetImageCount(),
                       image.GetMetadata(),
                       DirectX::DDS_FLAGS_NONE,
                       outputPathAsWideString.c_str());

    return false;
}

#endif //DIRECTXTEX_BRIDGE_LIBRARY_CPP
