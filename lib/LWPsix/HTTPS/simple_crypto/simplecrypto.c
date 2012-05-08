#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SSL_NULL 0x00
#define SSL_KEYEXCHANGE_RSA 0x01
#define SSL_KEYEXCHANGE_DH 0x02
#define SSL_MAC_RSA 0x11
#define SSL_MAC_DSA 0x13
// and so on; create constants for any supported algo

char* encrypt(char* buf, char* key, int algorithm);
char* decrypt(char* buf, char* key, int algorithm);
char* extractKeyInfo(char* cert);

/*
 * These encryt and decrypt functions can be used for any
 * part of the negotiation: key exchange, bulk encryption,
 * message authentication, etc.
*/

// Only supports the identity function.
char* encrypt(char* buf, char* key, int algorithm) {
	if (SSL_NULL == algorithm) {
		return buf;
	}

	// Other algorithms here.  May need to tweak parameters.

	return buf; // default to no encryption
}

// Only supports the identity function.
char* decrypt(char* buf, char* key, int algorithm) {
	if (SSL_NULL == algorithm) {
		return buf;
	}

	// Other algorithms here.  May need to tweak paramters.
	
	return buf; // default to no encryption
}

// Defaults to TLS_NULL_WITH_NULL, i.e. no encryption.
char* extractKeyInfo(char* cert) {
	return "0x00/irrelevant";
}
