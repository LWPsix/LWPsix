use v6;

class LWPsix::Headers::CookieJar does ResponseExaminer does RequestDecorator	{
	has Cookie %!Cookies; 

	method serializePersistentData() { #serialize cookies in the CookieJar that have a valid Expires: header
	
		my $ser = "";
		my $size = +(%Cookies.kvs);
		my $ind = 0;		
		
		# for each domain and the associated cookie
		for %Cookies.kvs -> $domain, $cook {
			
			if $cook.expires ~~ DateTime { #if we have a valid expires, the cookie is intended to be persistent
				#delimit the domain and cookie with the @ character
				$ser = $ser ~ $domain ~ "@" ~ $cook;
				
				#for +(%Cookies) > 1, delimit the domain-cookie pairs with ampersand
				if ++$ind < $size {
					$ser = $ser ~ "&";
				}
			}
			
		}
		
		return $ser;
	
	}
	
	method serializeAllData() { #serialize all cookies in the CookieJar
	
		my $ser = "";
		my $size = +(%Cookies.kvs);
		my $ind = 0;		
		
		for %Cookies.kvs -> $domain, $cook {
			
			$ser = $ser ~ $domain ~ "@" ~ $cook;
				
			if ++$ind < $size {
				$ser = $ser ~ "&";
			}
		}
		
		return $ser;	
	}
	
	method deserializeData(String $data) {
	
		my @pairs = $data.split("&");
		
		for @pairs -> $pair {
			my @dcpair = $pair.split("@");
			addCookie(cookie => @dcpair[1], domain => @dcpair[0]);
		}
	}
	
	method loadData(String $data) { 
	
		#Parse and add cookies as needed from a dumped string: should it be the "Cookie: ..." field-value pair in string form? 
		#Or is this deserialization?
	}
	
	#Add a Cookie to this CookieJar.
	method addCookie(:$cookie, :$domain) {  #domain is from the Host: header field? 
	
		%Cookies{$domain} = $cookie;
	}
	

}