use v6;

class CredentialCache {
	#has
	has Identity %!Identities;	
	#has
	
	method serializeData() {
	}
	
	method loadData(:$data) { #how is $data formatted? 
	
	}
	
	method addIdentity(:$identity, :$domain, :$realm) {
	
		%Identities{($domain, $realm)} = $identity; 
		
	}
	
	
	#is this needed?
	
	method getIdentity(:$domain, :$realm) {
	
		return %Identities{($domain, $realm)};	
	
	}
	
}