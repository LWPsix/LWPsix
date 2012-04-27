gcc -c -fPIC cryptofunctions.c -o cryptofunctions.o
gcc cryptofunctions.o -shared -o cryptofunctions.so
rm cryptofunctions.o
