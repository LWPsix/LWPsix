class LWP::Headers::Identity {
	has $!username; # $.___ twigil for accessibility outside, $!___ for not
	has $!password;
	has $!security;

	method new is abstract;
	
	method text() {
	
		say "Username: $.username\nPassword: $.password";
	}


	method raw() { #for single-string data "serialization"
	
		return "$username+$password+$security";	
	
	}	
}