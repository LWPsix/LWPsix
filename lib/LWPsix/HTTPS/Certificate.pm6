use v6;
use Dependencies::NativeCall;
use LWPsix::HTTPS::CertificateValidator;
use LWPsix::HTTPS::TrustingCertificateValidator;

class LWPsix::HTTPS::Certificate {
	has Str $.raw;							# raw HTML cert; .raw() will return
	has	LWPsix::HTTPS::CertificateValidator $validator;	# validator
	has Str $!keyInfo;						# algorithm/key

	# Unfortunately, until a Rakudo bug involving parametric roles is fixed,
	# we can't have a native call in this class *and* in SslConnection:
#	sub extractKeyInfo(Str) returns Str is native("simplecrypto") { * }

	method new(Str $rawCert, LWPsix::HTTPS::CertificateValidator $val) {
		$.raw = $rawCert;
		$validator = $val;

#		$!keyInfo = extractKeyInfo($rawCert);

		return self.bless(*, $.raw, $validator, $!keyInfo);
	}
	
	method validate() {
		# invoke validator's validate method
		return $validator.validate();	
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
