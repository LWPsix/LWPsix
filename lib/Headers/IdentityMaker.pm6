class IdentityMaker {

	method make(:$sec, :$un, :$pw) returns Identity {

		if $sec {
			return DigestAuthIdentity.new($un, $pw);
		}
		else {
			return BasicAuthIdentity.new($un, $pw);
		}	
	
	}
	
	method parseMake(:$data) returns Identity {
	
		my @pcs = $data.split("+");
		
		if @pcs[2] eq "True" {
			return DigestAuthIdentity.new(@pcs[0], @pcs[1]);
		}
		else {
			return BasicAuthIdentity.new(@pcs[0], @pcs[1]);
		}
	
	}

}