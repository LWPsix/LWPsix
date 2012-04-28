use v6;
use LWPsix::Headers::Identity;

class LWPsix::Headers::CredentialCache {
	has LWP::Headers::Identity %!Identities;	
	
	method serializeData() { #Turn the identities into a raw string format.
		my $srl = "";
		my $size = +(%Identities); #Forced numeric context gives the size in terms of k-v pairs.
		my $ind = 0; "index" of the key-value pair.		
			
		#Zip the keys and values to work with them a pair at a time.
		for zip(%Identities.keys, %Identities.values) -> $k, $v { 
			$srl = $srl ~ $k ~ "&" ~ $v.raw(); #Separate by ampersand. Identity has its own delimiter via $IDEN.raw() .
			
			if $ind < $size {
				$srl = $srl ~ "^"; #If not at end, delimit the individual Identities by a caret.
			}
		}
		return $srl; #Return the pure string representing all identities within the cache.
	}
	
	#deserialize; field to specify 
	
	method deserializeData(:$data) {
		my @idens = $data.split("^"); #Get an array of the identities.
		
		for @idens -> $iden { #for each serialized identity
			my @pcs = $iden.split("&"); #Splits in format $domain|$realm & $identity
			
			# @pcs[0] = $domain|$realm and parseMake will recreate the appropriate
			# identity based on the raw data of the serialized identity.			
			
			%Identities{@pcs[0]} = IdentityMaker.parseMake(@pcs[1]);  
		}
	}
	
	#method loadData(:$data) { #how is $data formatted? 
	
	#}
	
	method addIdentity(:$identity, :$domain, :$realm) {
	
		%Identities{$domain~"|"~$realm} = $identity;
		
		#Messy, but allows access more easily.
		#Previously attempted to have an array of 
		#<$domain, $realm> as key, but could not
		#recover with the same "key" as input.
		
	}
	
	
	#is this needed?
	
	method getIdentity(:$domain, :$realm) {
	
		# If the $domain~"|"~$realm key does not give an Identity back,
		# can use this structure to handle:
		#if %Identities{$domain~"|"~$realm} ~~ Identity { #If the returned object is of type Identity
		#	Handle proper operations in this space, and an else for otherwise
		#	}
	
		
		return %Identities{$domain~"|"~$realm};	#Returns Any() if not existent.
	
	}
	
}
