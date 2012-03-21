use v6;

class Certificate {
	has	Int	$!expiration;
	has	CertificateValidator !validator;
	has $!key;
	
	method new(...) {
		# if no validator, make a TrustingCertificateValidator
	}
	
	method validate {
		# invoke validator's validate method
	}
	
	# Do I need this?  Or do I use the symbol that removes need for getter?
	method get_public_key {
		return $!key;
	}
}