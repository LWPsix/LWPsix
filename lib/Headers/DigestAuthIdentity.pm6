use v6;
use Digest::MD5;

class DigestAuthIdentity is Identity{

	method new(:$un, :$pw) {
		
		$!username = md5_hex($un);
		$!password = md5_hex($pw);
		$!security = true;
		
	}
	
}