using v6;

class Certificate {
	has	Int	$expiration;
	has	CertificateValidator &!validator;	# can invocable have a type?
	
	method get_public_key {
		
	}
}

class CertificateValidator {
	method validate { }						# how do I make this abstract
}

class TrustingCertificateValidator is CertificateValidator {
	method validate {
		return true;
	}
}

class KeepAliveHttpsProtocol is HttpProtocol {
	# examiners, decorators, blah blah blah
	
	# request
	# get_connection returns SslConnection
}

class SslConnection is Connection {
	has Certificate !cert;					# private
	
	# send
	# recv
}