use v6;
use LWPsix::Protocol;
use LWPsix::Response;
use LWPsix::Connection;
use LWPsix::HTTPS::SslConnection;
use LWPsix::HTTPS::SslConnectionNegotiator;
use LWPsix::HTTPS::SimpleSslConnectionNegotiator;
use LWPsix::HTTPS::CertificateValidator;
use LWPsix::HTTPS::TrustingCertificateValidator;
use LWPsix::Headers::ResponseExaminer;
use LWPsix::Headers::RequestDecorator;

class LWPsix::HTTPS::HttpsProtocol is LWPsix::Protocol {
	has Int $verbose = 0;
	has LWPsix::HTTPS::CertificateValidator $validator; 
	has LWPsix::HTTPS::SslConnectionNegotiator $negotiator; 
	#has LWPsix::Connection %.connection_for_host;
	#has LWPsix::Headers::ResponseExaminer @.examiners;
	#has LWPsix::Headers::RequestDecorator @.decorators;

	method new($v = 0, $val?, $neg?) {
		$verbose = $v;
	
		# Default to trusting validator.
		if ($val.defined) {
			$validator = $val;
		}
		else {
			$validator = LWPsix::HTTPS::TrustingCertificateValidator.new();
		}
		
		# Default to simple negotiator (skeleton).
		if ($neg.defined) {
			$negotiator = $neg;
		}
		else {
			$negotiator = LWPsix::HTTPS::SimpleSslConnectionNegotiator.new();
		}

		return self.bless(*, $verbose, $validator, $negotiator);
	}

	method request(Str $url, Str $method = 'GET') returns LWPsix::Response {
		my $sep = $url.index("/");
		my $host;
		my $file;

		# default to root directory
		if ! $sep.defined {
			$host = $url;
			$file = "/";
		}
		else {
			$host = substr($url, 0, $url.index("/"));	
			$file = substr($url, $url.index("/"));
		}

        my Str @lines;
        @lines.push: "{$method} {$file} HTTP/1.1";
		@lines.push: "Host: {$host}";
		@lines.push: "Connection: close";

		say "Constructing $method request for $url...";
        # TODO: Decorators
		say "Adding request decorators...";

        my Str $request = @lines.join: "\r\n";
		
		say "Accessing socket...";
        my $connection = .get_connection($url);
		say "Sending request...";
		say $request;
        $connection.send($request ~ "\n\n");

		# TODO: support redirects and add a max-redirects
        my LWPsix::Response $resp = LWPsix::Response.new($connection.recv());
		say "Received a response from $url!";
	}

	# One shot for now...
	method get_connection(Str $url) {
		my ($host, $port) = $url.split(":");
		if (!($port.defined)) {
			$port = 443;
		}

		# TODO: Check hash  of existing connections for this host &
		# return one if it exists.			
	
		# For now, just make a new connection:
		return .new_connection($host, $port);
	}
	
	# Calls SslConnection constructor, which opens the socket, takes care of
	# the SSL negotiation, and reads certificate and crypto information into
	# its internal structures. 
	method new_connection(Str $host, Str $port) returns LWPsix::Connection {
		return LWPsix::HTTPS::SslConnection.new($verbose, $host, $port, $negotiator);
	}
}
