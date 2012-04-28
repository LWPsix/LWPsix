use v6;
use LWPsix::Headers::Identity;
use Dependencies::Digest::MD5;

class LWPsix::Headers::DigestAuthIdentity is LWPsix::Headers::Identity {

	method new(:$un, :$pw) {
		
		self.bless(*, 
			security => True, #Indicate that this is secure.
			username => Dependencies::Digest::MD5::auth::md5_hex($un), 
			password => Dependencies::Digest::MD5::auth::md5_hex($pw)); #Encrypt username and password before storing.
		
	}
	
}
