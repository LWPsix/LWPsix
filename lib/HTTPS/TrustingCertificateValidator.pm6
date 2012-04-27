use v6;

class LWPsix::HTTPS::TrustingCertificateValidator is LWPsix::HTTPS::CertificateValidator {
	method new {
		return self.bless;
	}

	method validate {
		return true;
	}
}
