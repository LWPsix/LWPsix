use v6;

class LWP::Headers::BasicAuthIdentity is Identity {

	method new(:$un, :$pw) {
		
		#Store username and password in plaintext.
		$!username = $un;
		$!password = $pw;
		
		#Indicate (for serialization purposes) that this is plaintext.
		$!security = false;
		
	}
	

}