use v6;

class LWPsix::Headers::BasicAuthIdentity is Identity {

	method new(:$un, :$pw) {

		self.bless(*, 
					security => False, 					#Indicate (for serialization purposes) that this is plaintext.
					username => $un, password => $pw); 	#Store username and password in plaintext.
		
	}
	

}