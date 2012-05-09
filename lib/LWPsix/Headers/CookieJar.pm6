use v6;
use LWPsix::Headers::ResponseExaminer;
use LWPsix::Headers::RequestDecorator;
use LWPsix::Headers::Cookie;
use LWPsix::Headers::HeaderSet;

#Commented out during compilation due to compiler/VM errors with roles
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
	
	#STUBBED METHOD FROM RequestDecorator	
	
	# Returns a HeaderSet: 
	# Assuming that this is what we are passed
	method decorationsForUrl(:@ks, :@vls) returns LWPsix::Headers::HeaderSet {
		#return LWPsix::Headers::HeaderSet.new(fields => @ks, values => @vls);
		
		# Should the header set return something like, "field", "=value"? 
		# Easily done, but would it be necessary?
	}
	
	#STUBBED METHOD FROM ResponseExaminer	
	
	method handleResponse(Str :$data) {
		my @fields;
		my @values;
		
		my @lines = $data.split("\n"); #Split according to newlines
		
		shift(@lines);
		for @lines -> $line {
			
			# We can't just split on ":", as timestamps have HH:MM:SS format.
			# With standardized headers from the HTTP response received,
			# this ensures that we get the label and the contents.			
			my @parts = $line.split(": "); 
			
			if +(@parts) == 2 {
				@fields[+(@fields)] = @parts[0];
				
				@values[+(@values)] = @parts[1];
			}
		}
		
		return LWPsix::Headers::HeaderSet.new(fields => @fields, values => @values);
	}
}
=end DOG
