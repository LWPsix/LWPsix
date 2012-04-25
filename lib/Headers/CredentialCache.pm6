use v6;

class CredentialCache {
	#has
	has Identity %!Identities;	
	#has
	
	method serializeData() {
		my $srl = "";
		
		
	
	}
	
	method loadData(:$data) { #how is $data formatted? 
	
	}
	
	method addIdentity(:$identity, :$domain, :$realm) {
	
		%Identities{$domain~$srealm} = $identity;
		#Messy, but allows access more easily.
		#Previously attempted to have an array of 
		#<$domain, $realm> as key, but could not
		#recover with the same "key" as input.
		
	}
	
	
	#is this needed?
	
	method getIdentity(:$domain, :$realm) {
	
		return %Identities{$domain~$realm};	
	
	}
	
}