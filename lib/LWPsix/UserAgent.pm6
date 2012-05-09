use v6;
use LWPsix::Protocol;
use LWPsix::HTTP::HttpProtocol;
use LWPsix::Response;

class LWPsix::UserAgent {
    # TODO: type the protocol hash to Str => LWPsix::Protocol
    my %.protocols; # compiler nixed ! twigil - mel

    method new() {
=begin httpfix
		%protocols{'http'} .= LWPsix::HTTP::HttpProtocol.new;		
=end httpfix
		self.bless(*);
	}
	# TODO: multi method new() populates protocols according to parameters

    method request(Str $url) {
        my ($scheme, $path) = $url.split: <:>, 2;
        # TODO: error-check the above

		# defaulting to http	
		return LWPsix::HTTP::HttpProtocol.request($url);
=begin protoswitch
        my LWPsix::Protocol $proto = %.protocols{$scheme};
		if ! $proto.defined {
			# TODO: match $scheme to some class within library
		}
        return $proto.request($path);
=end protoswitch
    }
}

