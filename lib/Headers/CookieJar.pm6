use v6;

class CookieJar does ResponseExaminer does RequestDecorator	{
	#has
	has Cookie %!Cookies; 
	#has

	method serializePersistentData() { #serialize SOME OF the things...
		#only if $.expires on the cookie is set to the "doesn't expire" value?	
	
	}
	
	method serializeAllData() { #serialize ALL the things!
	
		return ~ @!Cookies; #same as concatenating them all, basically - could this work?
	
	}
	
	method loadData(String $data) { 
	
		#Parse and add cookies as needed from a dumped string: should it be the "Cookie: ..." field-value pair in string form? 
	}
	
	#Add a Cookie to this CookieJar.
	method addCookie(:$cookie, :$domain) {  #domain is from the Host: header field? 
	
		%Cookies{$domain} = $cookie;
	}
	

}