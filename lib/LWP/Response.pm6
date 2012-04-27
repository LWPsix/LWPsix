use v6;

class LWPsix::LWP::Response {
	has $.content_type;
	has $.status;
	has $.data;

	# TODO: new() take in response scalar and serialize it into Response object
	method new(Str $response) {
		# TODO: bless to create object
	}
}
