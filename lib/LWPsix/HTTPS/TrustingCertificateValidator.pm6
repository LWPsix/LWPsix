use v6;
use LWPsix::HTTPS::CertificateValidator;

class LWPsix::HTTPS::TrustingCertificateValidator is LWPsix::HTTPS::CertificateValidator {
	method new() {
		return self.bless;
	}

	method validate() {
		return 1;
	}
}
