#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT extern
#endif

DLLEXPORT double * ReturnADoubleArray()
{
    double *foo = malloc(3 * sizeof(double));
    foo[0] = 23.45;
    foo[1] = -99.87;
    foo[2] = 0.25;
    return foo;
}

DLLEXPORT double TakeADoubleArrayAndAddElements(double *arr)
{
    return arr[0] + arr[1];
}

DLLEXPORT char ** ReturnAStringArray()
{
    char **foo = malloc(2 * sizeof(char *));
    foo[0] = "La Trappe";
    foo[1] = "Leffe";
    return foo;
}

DLLEXPORT int TakeAStringArrayAndReturnTotalLength(char **arr)
{
    return (int)(strlen(arr[0]) + strlen(arr[1]));
}
