#include <stdio.h>

#ifdef WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT extern
#endif

DLLEXPORT void * ReturnSomePointer()
{
    char *x = "ok 1 - Got passed back the pointer I returned";
    return x;
}

DLLEXPORT void TakeSomePointer(void *ptr)
{
    printf("%s\n", ptr);
    fflush(stdout);
}
