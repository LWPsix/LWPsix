use v6;
use LWPsix::HTTPS::Certificate;

class LWPsix::HTTPS::SslHandshakeNegotiator {
	# An SslHandshakeNegotiator must implement this function,
	# which must return 0 if successful and non-zero if not.
	method negotiate() returns Int {
		... # abstract
	}

	method getCertificate() 
}
