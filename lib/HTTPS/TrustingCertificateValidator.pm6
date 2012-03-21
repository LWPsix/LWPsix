use v6;

class TrustingCertificateValidator is CertificateValidator {
	method new {
		return self.bless;
	}

	method validate {
		return true;
	}
}