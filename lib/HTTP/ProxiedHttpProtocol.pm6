class ProxiedHttpProtocol is HttpProtocol {
	has $host
	has $port
//	has $user
//	has $pass


/*
"GET /index.html HTTP/1.0" is the request you send to a web server,
"GET http://www.linuxquestions.org/index.html HTTP/1.0" is the one you send to a proxy server.
ProxiedHttpProtocol will need to check for full-path uris..
*/


	method request($method, $uri, $header, $content) {
		//sockets stuff shamelessly stolen from LWP::Simple's make_request

		my $sock = IO::Socket::INET.new(:$host, :$port);
		my $req_str = $method ~ " {$uri} HTTP/1.1\r\n"
        		~ $headers
       			~ "\r\n";
		$sock.send($req_str);
		my $resp = $sock.recv();
   		$sock.close();

		parse_response(..);

	}
}