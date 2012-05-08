#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char* encrypt(char* buf, char* key, int algorithm);
char* decrypt(char* buf, char* key, int algorithm);
char* extractKeyInfo(char* cert);

// placeholder that shortens given text
char* encrypt(char* buf, char* key, int algorithm) {
	if (strlen(buf) <= 5) {
		return buf;
	}

	buf[strlen(buf)-5] = '\0';
	return buf;
}

// placeholder that lengthens given text
char* decrypt(char* buf, char* key, int algorithm) {
	int l = strlen(buf);
	int i;

	buf = (char*)realloc(buf, (l+4) * sizeof(char));
	for (i = 0; i < 4; i++) {
		buf[l+i] = 'f';
	}
	buf[l+i] = '\0';

	return buf;
}

// asdfdsf
char* extractKeyInfo(char* cert) {
	return "DSA/fe678cb9c6e238011e4038ad0b7c240f0";
}


