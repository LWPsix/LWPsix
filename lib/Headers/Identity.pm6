class Identity {
	has $!username; # $.___ twigil for accessibility outside, $!___ for not
	has $!password;


	method new is abstract;
	
	method text() {
	
		say "Username: $.username\nPassword: $.password";
	}
	
}