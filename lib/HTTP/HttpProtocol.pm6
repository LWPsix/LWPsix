use v6;

class HttpProtocol is Protocol {
	has Examiner @.examiners;
	has Decorator @.decorators;
	has Connection %connections;
	has $p_host;
	has $p_port;

	method request(Str $url, $method = 'GET') returns Response {
        # TODO
		my $req_str = $method ~ " {$uri} HTTP/1.1\r\n" 
			~ $headers
			~ "\r\n";
		my $connection = get_connection($url);
		$connection.send($req_str);
		my $resp = $connection.recv();
		return $resp;
	}


	method get_connection(Str $URI) returns Connection {
		my ($host, $port) = $URI.split(":");
		if(%connections{$host})
			return %connections{$host};
		else {
			my $connection = new_connection($host, $port);
			%connections.push($host => $connection));
			return connection;
		}

	method new_connection(Str $host, Str $port) returns Connection {
        	my $connection = Connection.new($host, $port);
		return $connection;
	}

# "GET /index.html HTTP/1.0" is the request you send to a web server,
# "GET http://www.linuxquestions.org/index.html HTTP/1.0" is the one you send to
# a proxy server. ProxiedHttpProtocol will need to check for full-path uris..

# should implement get_connection and modify the request
# headers with an examiner / decorator
}
