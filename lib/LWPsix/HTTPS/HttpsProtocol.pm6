use v6;
use LWPsix::Protocol;
use LWPsix::Response;
use LWPsix::Connection;
use LWPsix::HTTPS::SslConnection;

class LWPsix::HTTPS::HttpsProtocol is LWPsix::Protocol {
	#has Examiner @.examiners; 				# get fully namespace-qualified types
	#has Decorator @.decorators;			# ...
	#has Connection %.connection_for_host;	# ...

	method new() {
		# placeholder
		return self.bless(*);
	}

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

	# one shot for now
	method get_connection(Str $url) {
		my ($host, $port) = $url.split(":");
		if (!($port.defined)) {
			$port = 443;
		}
		
		return .new_connection($host, $port);
	}
	
	# Calls SslConnection constructor, which opens the socket & stores the
	# immediately-served certificate.
	method new_connection(Str $host, Str $port) returns LWPsix::Connection {
		return LWPsix::HTTPS::SslConnection.new($host, $port);
	}
}
