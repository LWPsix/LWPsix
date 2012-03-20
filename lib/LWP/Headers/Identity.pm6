role Identity {
	has $.username;
	has $.password;


	method new(:$Username, :$Password) { ... }
	
	method text() { ... }
	
}