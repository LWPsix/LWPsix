use v6;
use LWPsix::Headers::HeaderSet;

class LWPsix::Headers::Cookie {
    has Str $.name = die "'name' field required";
    has Str $.value;		
    has Str $.path;			
    has DateTime $.expires;
    has Bool $.http_only;
    has Bool $.secure;
    
    has LWPsix::Headers::HeaderSet %cook-fields;

    method ^parse(Str $header) {
        #Parse a Cookie returned from the value associated with the "Set-Cookie: " header
        
        my @fvs = $header.split("; ");
        for @fvs -> $line {
        	my @pairing = $line.split("=");
        	if @pairing[0] ne "Domain" {
        		%cook-fields{@pairing[0]} = @pairing[1];
			}
        }
    }
    
    method get(Str $field) {
    	return %cook-fields{$field};
    }

    method Str {        
        return $.name~"%"~$.value~"%"~$.path~"%"~$.expires~"%"~$.http_only~"%"~$.secure; #Delimiter will be %
    }
}
