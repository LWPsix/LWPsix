use LWPsix::Response;
use LWPsix::Protocol;
use LWPsix::ConcreteConnection;
use LWPsix::Headers::ResponseExaminer;
use LWPsix::Headers::RequestDecorator;

class LWPsix::HTTP::HttpProtocol is LWPsix::Protocol {
    #has LWPsix::Headers::ResponseExaminer @.examiners;
    #has LWPsix::Headers::RequestDecorator @.decorators;
    #has LWPsix::Connection %.connection_for_host;
    #has ProxyServer $.proxy;

  method request(Str $url, Str :$method = 'GET') {
        my Str @lines;
        @lines.push: "{$method} {$url} HTTP/1.1";
		say "Constructing $method request for $url...";
        # TODO: Decorators
		say "Adding request decorators...";

        my Str $request = @lines.join: "\r\n";
		
		say "Accessing socket...";
        #my LWPsix::ConcreteConnection $connection = LWPsix::HTTP::HttpProtocol.get_connection($url);
	my $connection = IO::Socket::INET.new(host => $url);	
	say "Sending request...";
	say $request;
        $connection.send($request ~ "\n\n");

		# TODO: support redirects and add a max-redirects
        #my LWPsix::Response $resp = LWPsix::Response.new($connection.recv());
		say "Received a response from $url!";
        return $connection.recv();
    }

    method get_connection(Str $service) {
        # TODO: proxies
		
        my ($host, $port) = $service.split(":", 2);
	if ! $port.defined {
		$port = 80;
	}
=begin keepalive
        # TODO: kill if not keepalive
        if !%.connection_for_host{$host} {
            my Connection $connection .= new: $host, $port;
            %.connection_for_host{$host} = $connection;
        }
        return %.connection_for_host{$host};
=end keepalive
		say "No keep-alive; creating new connection...";
        return LWPsix::ConcreteConnection.new($host, $port);
    }
}

