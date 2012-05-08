use v6;
use LWPsix::HTTPS::Certificate;
use LWPsix::HTTPS::SslConnectionNegotiator;

# Suggested skeleton for a fully-realized negotiator.
class LWPsix::HTTPS::SimpleSslConnectionNegotiator is LWPsix::HTTPS::SslConnectionNegotiator {
	has $!sock;
	has LWPsix::HTTPS::Certificate $!cert;

	method new($s) {
		$!sock = $s;
		$!cert = undef;
	}

	method negotiate() returns Int {
		if (.exchangeHellos()) {
			say 'Problem initiating SSL handshake.';
			return 1; # or specific error code
		}

		if (.acceptCertificate()) {
			say 'Problem accepting server certificate.';
			return 1; # or specific error code
		}

		if (.establishKey()) {
			say 'Problem changing cipher suite.'
			return 1; # or specific error code
		}

		# Success!
		return 0;
	}

	# TODO
	method exchangeHellos() returns Int {
		# Send client hello: list cryptographic capabilities, 28-bit random number.

		# Accept server hello determining cipher suite; wait for hello done.

		return 1; # 0 indicates success
	} 

	# TODO
	method acceptCertificate() returns Int {
		# Accept certificate; read it into internal Certificate structure.

		return 1; # 0 indicates success
	}

	# TODO
	method establishKey() returns Int {
		# Send "client key exchange" (pre-master secret).

		# Send "change cipher spec".

		# Establish master secret; read this into certificate structure.

		# Send encrypted "finish".

		# Accept server "change cipher spec", "finished".
	
		return 1; # 0 indicates success
	}

	method getCertificate() returns LWPsix::HTTPS::Certificate {
		return $!cert;
	}
}
