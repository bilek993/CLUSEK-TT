#ifndef DIRECTXTEX_BRIDGE_LIBRARY_CPP
#define DIRECTXTEX_BRIDGE_LIBRARY_CPP

#include <DirectXTex.h>

extern "C" __declspec(dllexport)
bool compressAndConvertToDds()
{
    DirectX::ScratchImage image;
    HRESULT hr = LoadFromWICFile( L"C:\\a\\x.png", DirectX::WIC_FLAGS_NONE, nullptr, image );

    hr = SaveToDDSFile(image.GetImages(),
                       image.GetImageCount(),
                       image.GetMetadata(),
                       DirectX::DDS_FLAGS_NONE,
                       L"C:\\a\\xyz.dds");

    return false;
}

#endif //DIRECTXTEX_BRIDGE_LIBRARY_CPP
