#ifndef DIRECTXTEX_BRIDGE_LIBRARY_CPP
#define DIRECTXTEX_BRIDGE_LIBRARY_CPP

extern "C" __declspec(dllexport)
double get_temperature()
{
    return 32.0F;
}

#endif //DIRECTXTEX_BRIDGE_LIBRARY_CPP
