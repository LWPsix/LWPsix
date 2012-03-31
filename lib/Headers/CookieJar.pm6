use v6;

class CookieJar does ResponseExaminer does RequestDecorator	{
	#has
	has Cookie @!Cookies; 
	#has

	method serializePersistentData() {
	}
	
	method serializeAllData() {
	}
	
	method loadData(String $data) { 
	}
	
	#Add a Cookie to this CookieJar.
	method addCookie(:$cookie, :$domain) { #Is this method signature correct? We may need to use slurpy parameters instead.
	
		#my @tmp = @Cookies;
		#@Cookies = (@tmp, @(<cookie.new({domain => $domain,)>));
	}
	

}