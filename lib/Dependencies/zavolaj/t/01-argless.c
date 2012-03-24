#include <stdio.h>

#ifdef WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT extern
#endif

DLLEXPORT void Argless()
{
    printf("ok 1 - Called argless function\n");
    fflush(stdout);
}
