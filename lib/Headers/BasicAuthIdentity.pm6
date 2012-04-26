use v6;

class BasicAuthIdentity is Identity {

	method new(:$un, :$pw) {
		
		$!username = $un;
		$!password = $pw;
		$!security = false;
		
	}
	

}