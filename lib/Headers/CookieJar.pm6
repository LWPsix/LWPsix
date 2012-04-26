use v6;

class CookieJar does ResponseExaminer does RequestDecorator	{
	#has
	has Cookie @!Cookies; 
	#has

	method serializePersistentData() { #serialize SOME OF the things...
		#only if $.expires on the cookie is set to the "doesn't expire" value?	
	
	}
	
	method serializeAllData() { #serialize ALL the things!
	
		return ~ @!Cookies; #same as concatenating them all, basically - could this work?
	
	}
	
	method loadData(String $data) { 
	}
	
	#Add a Cookie to this CookieJar.
	method addCookie(:$cookie, :$domain) { #Is this method signature correct? We may need to use slurpy parameters instead.
	
		#my @tmp = @Cookies;
		#@Cookies = (@tmp, @(<cookie.new({domain => $domain,)>));
	}
	

}