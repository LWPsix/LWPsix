use v6;
use LWPsix::HTTPS::Certificate;

class LWPsix::HTTPS::SslConnectionNegotiator {
	has $!sock;
	has LWPsix::HTTPS::Certificate $!cert;

	# An SslConnectionNegotiator must implement this function,
	# which must return 0 if successful and non-zero if not.
	method negotiate() returns Int {
		... # abstract
	}

	method getCertificate() returns LWPsix::HTTPS::Certificate {
		return $!cert;
	}
}
