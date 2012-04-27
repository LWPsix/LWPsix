use v6;
use NativeCall;

class LWPsix::HTTPS::Certificate {
	has Str $.raw;							# raw HTML cert; .raw() will return
	has	CertificateValidator !validator;	# validator
	has Str $!keyInfo;						# algorithm/key

	sub extractKeyInfo(Str) returns Str is native("cryptofunctions") { * }

	method new(Str $rawCert, CertificateValidator val?) {
		$.raw = rawCert;
		if (defined(val)) {
			!validator = val;
		}
		else {
			!validator = TrustingValidator.new();
		}
		$!keyInfo = extractKeyInfo($rawCert);
		
#........................................
		say "raw = $.raw";
		say "keyInfo = $!keyInfo";
#........................................

		return self.bless($.raw, !validator, $!keyInfo);
	}
	
	method validate() {
		# invoke validator's validate method
		return validator.validate();	
	}

	method getKey() {
		my (Str $key, Str $alg) = $!keyInfo.split('/');
		
		return $key; 
	}

	method getAlg() {
		my (Str $key, Str $alg) = $!keyInfo.split('/');
		
		return $alg;
	}
}
