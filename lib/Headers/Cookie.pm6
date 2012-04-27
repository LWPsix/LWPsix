class LWP::Headers::Cookie {
    has Str $.name = die "'name' field required";
    has Str $.value;		
    has Str $.path;			
    has DateTime $.expires;	#What indicates whether or not it expires? $hour, $minute, $second == 00?
    has Bool $.http_only;
    has Bool $.secure;
    
    has HeaderSet %cook-fields;
    # XXX: Cookie's don't have domains - domains have cookies

    method ^parse(Str $header) {
        #Parse a Cookie returned from the value associated with the "Set-Cookie: " header
        
        my @fvs = $header.split("; ");
        for @fvs -> $line {
        	my @pairing = $line.split("=");
        	%cook-fields{@pairing[0]} = @pairing[1];
        }
    }
    
    method get(Str $field) {
    	return %cook-fields{"Expires"};
    }

    method Str {
        # serialize; output should be parse-compatible
        
        return $.name~"%"~$.value~"%"~$.path~"%"~$.expires~"%"~$.http_only~"%"~$.secure; #Delimiter will be %
    }
}
