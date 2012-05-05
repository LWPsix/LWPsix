use v6;
use Dependencies::NativeCall;
use LWPsix::Response;
use LWPsix::Connection;
use LWPsix::HTTPS::Certificate;

class LWPsix::HTTPS::SslConnection is LWPsix::Connection {
	has Int $.verbose;
	has $.sock;
	has LWPsix::HTTPS::Certificate $certificate;

	sub encrypt(Str, Str, Int) returns Str is native("cryptofunctions") { * }
	sub decrypt(Str, Str, Int) returns Str is native("cryptofunctions") { * }

	method new(Str $host, Int $port, Int $v) {
		$.verbose = $v;		

		$.sock = IO::Socket::Inet.new($host, $port);

		# Server should send certificate immediately...
		my Str $response = $.sock.recv();

		$certificate = LWPsix::HTTPS::Certificate.new($response);

		return self.bless(*, $.verbose, $.sock, $certificate);
	}

	# prelim ... no error checking etc.
	method send(Str $req) {
		my Str $toSend = encrypt($req, $certificate.getKey(), $certificate.getAlg());
		my $status = 500; # for testing
		$status = $.sock.send($toSend);

	}
	
	# prelim
	method recv() returns LWPsix::Response {
		my Str $recvd = $.sock.recv();
		my Str $decrypted = decrypt($recvd, $certificate.getKey(), $certificate.getAlg());
		
		return LWPsix::Response.new($decrypted);
	}

	method kill() {
		$.sock.close();
	}
}

