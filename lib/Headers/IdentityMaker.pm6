class LWP::Headers::IdentityMaker { #Factory class for creating identities based on specified security preference.

	#$sec is a Bool, $un and $pw are Str
	method make(:$sec, :$un, :$pw) returns Identity {

		if $sec {
			return DigestAuthIdentity.new($un, $pw);
		}
		else {
			return BasicAuthIdentity.new($un, $pw);
		}	
	
	}
	
	#Given a "serialized" identity, create the appropriate type of identity
	method parseMake(:$data) returns Identity {
	
		my @pcs = $data.split("+"); # $data is formatted as $username+$password+$security. $security indicates digest/basic.
		
		if @pcs[2] eq "True" {
			return DigestAuthIdentity.new(@pcs[0], @pcs[1]);
		}
		else {
			return BasicAuthIdentity.new(@pcs[0], @pcs[1]);
		}
	
	}

}