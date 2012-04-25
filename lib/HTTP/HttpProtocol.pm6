class HttpProtocol is Protocol {
    has Examiner @.examiners;
    has Decorator @.decorators;
    has Connection %.connection_for_host;
    has ProxyServer $.proxy;

    method request(Str $url, Str $:method = <GET>) returns Response {
        # TODO: separate $url's components
        # "GET /index.html HTTP/1.0" is the request you send to a web server,
        # "GET http://www.linuxquestions.org/index.html HTTP/1.0" is the one you
        # send to a proxy server.

        my Str @lines;
        @lines.push: "{$method} {$url} HTTP/1.1";
        # TODO: Decorators
        my Str $request = @lines.join: "\r\n";

        my $connection = get_connection: $url;
        $connection.send: $request;
        # TODO: recv ALL the bytes
        my $resp = $connection.recv();
        return $resp;
    }

    method get_connection(Str $url) returns Connection {
        # TODO: proxies

        # TODO: handle implicit 80
        my ($host, $port) = $url.split(":");

        # TODO: kill if not keepalive
        if !%.connection_for_host{$host} {
            my Connection $connection .= new: $host, $port;
            %.connection_for_host{$host} = $connection;
        }
        return %.connection_for_host{$host};
    }
}
