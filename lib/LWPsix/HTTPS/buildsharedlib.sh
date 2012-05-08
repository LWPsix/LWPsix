gcc -c -fPIC simplecrypto.c -o simplecrypto.o
gcc simplecrypto.o -shared -o simplecrypto.so
rm simplecrypto.o
