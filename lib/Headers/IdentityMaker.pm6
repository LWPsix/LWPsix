class IdentityMaker {

	method make(:$sec, :$un, :$pw) returns Identity{

		if($sec)
		{
			return BasicAuthIdentity.new($un, $pw);
		}
		else
		{
			return DigestAuthIdentity.new($un, $pw);
		}	
	
	}

}