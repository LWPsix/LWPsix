use LWPsix::Response;
use LWPsix::Protocol;
use LWPsix::Connection;
use LWPsix::Headers::ResponseExaminer;
use LWPsix::Headers::RequestDecorator;

class LWPsix::HTTP::HttpProtocol is LWPsix::Protocol {
    #has LWPsix::Headers::ResponseExaminer @.examiners;
    #has LWPsix::Headers::RequestDecorator @.decorators;
    has LWPsix::Connection %.connection_for_host;
    #has ProxyServer $.proxy;

  method request(Str $url, Str :$method = 'GET') returns LWPsix::Response {
        # TODO: separate $url's components
        # "GET /index.html HTTP/1.0" is the request you send to a web server,
        # "GET http://www.linuxquestions.org/index.html HTTP/1.0" is the one you
        # send to a proxy server.

        my Str @lines;
        @lines.push: "{$method} {$url} HTTP/1.1";
		say "Constructing $method request for $url...";
        # TODO: Decorators
		say "Adding request decorators...";

        my Str $request = @lines.join: "\r\n";
		
		say "Accessing socket...";
        my LWPsix::Connection $connection = .get_connection($url);
		say "Sending request...";
        $connection.send($request);

		# TODO: support redirects and add a max-redirects
	
        my LWPsix::Response $resp .= new: $connection.recv();
		say "Received a response from $url!";
        return $resp;
    }

    method get_connection(Str $service) returns LWPsix::Connection {
        # TODO: proxies
		
        my ($host, $port) = $service.split(":", 2);
        # TODO: error-check the above; default to 80

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
