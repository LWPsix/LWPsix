use v6;
use LWPsix::Protocol;
use LWPsix::Response;

class LWPsix::UserAgent {
    my LWPsix::Protocol %protocols; # compiler nixed ! twigil - mel

    method new() {
        self.bless(*);
        # TODO: populates protocols according to parameters
    }

    # TODO: accept arbitrary params OR formalize format for requests
    method request(Str $url) returns LWPsix::Response {
        my Str ($scheme, $path) = $url.split: <:>, 2;
        # TODO: error-check the above
		
        my LWPsix::Protocol $proto = %protocols{$scheme};
		if ! $proto.defined {
			# TODO: match $scheme to some class within library
		}

        return $proto.request: $path;
    }
}
