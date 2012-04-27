use v6;
use Digest::MD5;

class DigestAuthIdentity is Identity{

	method new(:$un, :$pw) {
		
		#Encrypt username and password before storing.
		$!username = md5_hex($un);
		$!password = md5_hex($pw);
		$!security = true;
		
	}
	
}