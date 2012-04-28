use v6;
use Digest::MD5;

class LWPsix::Headers::DigestAuthIdentity is Identity{

	method new(:$un, :$pw) {
		
		self.bless(*, 
					security => True, 					#Indicate (for serialization purposes) that this is secure.
					username => md5_hex($un), password => md5_hex($pw)); 	#Encrypt username and password before storing.
		
	}
	
}