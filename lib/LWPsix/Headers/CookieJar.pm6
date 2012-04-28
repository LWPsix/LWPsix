use v6;
use LWPsix::Headers::ResponseExaminer;
use LWPsix::Headers::RequestDecorator;
use LWPsix::Headers::Cookie;
use LWPsix::Headers::HeaderSet;

# The errors I get seem to have to do with roles...  although they persist when
# I comment out the "does" stuff...  Idk.  Just commenting this out so you can play around with it.

=begin DOG
class LWPsix::Headers::CookieJar does LWPsix::Headers::ResponseExaminer does LWPsix::Headers::RequestDecorator {
	has LWPsix::Headers::Cookie %!Cookies; 


	#serialize cookies in the CookieJar that have a valid Expires: header
	method serializePersistentData() returns Str {
	
		my $ser = "";
		my $size = +(%!Cookies.kvs);
		my $ind = 0;		
		
		# for each domain and the associated cookie
		for %!Cookies.kvs -> $domain, $cook {
			
			if $cook.expires ~~ DateTime { #if we have a valid expires, the cookie is intended to be persistent
				#delimit the domain and cookie with the @ character
				$ser = $ser ~ $domain ~ "@" ~ $cook;
				
				#for +(%!Cookies) > 1, delimit the domain-cookie pairs with ampersand
				if ++$ind < $size {
					$ser = $ser ~ "&";
				}
			}
			
		}
		
		return $ser;
	
	}

	# serialize all cookies in the CookieJar	
	method serializeAllData() returns Str { 
	
		my $ser = "";
		my $size = +(%!Cookies.kvs);
		my $ind = 0;		
		
		for %!Cookies.kvs -> $domain, $cook {
			
			$ser = $ser ~ $domain ~ "@" ~ $cook;
				
			if ++$ind < $size {
				$ser = $ser ~ "&";
			}
		}
		
		return $ser;	
	}
	
	method deserializeData(Str $data) {
	
		my @pairs = $data.split("&");
		
		for @pairs -> $pair {
			my @dcpair = $pair.split("@");
			.addCookie(cookie => @dcpair[1], domain => @dcpair[0]);
		}
	}
	
	method loadData(Str $data) { 
	
		#Parse and add cookies as needed from a dumped string: should it be the "Cookie: ..." field-value pair in string form? 
		#Or is this deserialization?
	}
	
	#Add a Cookie to this CookieJar.
	method addCookie($cookie, $domain) {  #domain is from the Host: header field? 
	
		%!Cookies{$domain} = $cookie;
	}
}
=end DOG
