class LWPsix::ConcreteConnection { #is Connection {
	has IO::Socket::INET $!sock;

	method new(Str $host, Int $port) {
        self.bless(*);
		$!sock .= new($host, $port);
		say "Created new socket for $host on port $port...";
	}

    method send(Str $req) {
		my $status = $!sock.send($req);
		# TODO: error check on whether socket is alive or not
		if ! $status {
			$status = $!sock.send($req);
		}
		say "Sent $req over socket!";
	}

    method recv() {
		my $recvd = $!sock.recv();
		# TODO: Parse response into a Response object
		return $recvd; #Response.new($recvd);
	}

    method DESTROY() {
		$!sock.close();
	}
}
