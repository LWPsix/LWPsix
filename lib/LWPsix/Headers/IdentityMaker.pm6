use v6;
use LWPsix::Headers::Identity;
use LWPsix::Headers::DigestAuthIdentity;
use LWPsix::Headers::BasicAuthIdentity;


# Factory class for creating identities based on specified security preference.
class LWPsix::Headers::IdentityMaker { 

	#$sec is a Bool, $un and $pw are Str
	method make(Bool :$sec, Str :$un, Str :$pw) returns LWPsix::Headers::Identity {

		if $sec {
			return LWPsix::Headers::DigestAuthIdentity.new($un, $pw);
		}
		else {
			return LWPsix::Headers::BasicAuthIdentity.new($un, $pw);
		}	
	
	}
	
	#Given a "serialized" identity, create the appropriate type of identity
	method parseMake(:$data) returns LWPsix::Headers::Identity {
	
		my @pcs = $data.split("+"); # $data is formatted as $username+$password+$security. $security indicates digest/basic.
		
		if @pcs[2] eq "True" {
			return LWPsix::Headers::DigestAuthIdentity.new(@pcs[0], @pcs[1]);
		}
		else {
			return LWPsix::Headers::BasicAuthIdentity.new(@pcs[0], @pcs[1]);
		}
	
	}

	#use Digest::MD5;
}
