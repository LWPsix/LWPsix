gcc -c -fPIC simplecrypto.c -o simplecrypto.o
gcc simplecrypto.o -shared -o simplecrypto.so
cp simplecrypto.so ../
rm simplecrypto.o
