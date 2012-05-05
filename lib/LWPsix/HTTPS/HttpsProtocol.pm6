use v6;
use LWPsix::Protocol;
use LWPsix::Response;
use LWPsix::Connection;
use LWPsix::HTTPS::SslConnection;
use LWPsix::Headers::ResponseExaminer;
use LWPsix::Headers::RequestDecorator;

class LWPsix::HTTPS::HttpsProtocol is LWPsix::Protocol {
	has Int $.verbose = 0;
	#has LWPsix::Connection %.connection_for_host;
	#has LWPsix::Headers::ResponseExaminer @.examiners;
	#has LWPsix::Headers::RequestDecorator @.decorators;

#	method new($v = 0) {
#		$.verbose = $v;
#
#		return self.bless(*, $.verbose);
#	}

	method request(Str $url, Str $method = 'GET') returns LWPsix::Response {
		my Str @lines;
		@lines.push("{$method} {$url} HTTP/1.1");
		my Str $request = @lines.join: "\r\n";

		# TODO: Decorators
		my LWPsix::Connection $connection = .get_connection($url);
			
		# TODO: Account for POST here & with optional parameters...
		if ($method eq 'POST') {

		}	

		$connection.send($request);

		# TODO: Redirects

		my $resp = $connection.recv();
		return $resp;
	}

	# One shot for now...
	method get_connection(Str $url) {
		my ($host, $port) = $url.split(":");
		if (!($port.defined)) {
			$port = 443;
		}

		# TODO: Check array of existing connections for this host &
		# return one if it exists.			
	
		# For now, just make a new connection:
		return .new_connection($host, $port);
	}
	
	# Calls SslConnection constructor, which opens the socket & stores the
	# immediately-served certificate.
	method new_connection(Str $host, Str $port) returns LWPsix::Connection {
		return LWPsix::HTTPS::SslConnection.new($host, $port, $.verbose);
	}
}
