use v6;
use Dependencies::NativeCall;
use LWPsix::Response;
use LWPsix::Connection;
use LWPsix::HTTPS::Certificate;
use LWPsix::HTTPS::SslConnectionNegotiator;

class LWPsix::HTTPS::SslConnection is LWPsix::Connection {
	has Int $.verbose;
	has $.sock;
	has LWPsix::HTTPS::SslConnectionNegotiator $negotiator;
	has LWPsix::HTTPS::Certificate $certificate;

	sub encrypt(Str, Str, Int) returns Str is native("cryptofunctions") { * }
	sub decrypt(Str, Str, Int) returns Str is native("cryptofunctions") { * }

	method new(Int $v, Str $host, Int $port) {
		$.verbose = $v;		

		$.sock = IO::Socket::Inet.new($host, $port);

		# Call negotiator, which does the handshake work.
		if ($negotiator.negotiate()) {
			say "Failure opening SSL connection.";
		}

		$certificate = $negotiator.getCertificate();

		return self.bless(*, $.verbose, $.sock, $negotiator, $certificate);
	}

	method send(Str $req) {
		my Str $toSend = '';

		#$toSend = encrypt($req, $certificate.getKey(), $certificate.getAlg());

		my $status = 500;
		$status = $.sock.send($toSend);

	}
	
	method recv() returns LWPsix::Response {
		my Str $recvd = $.sock.recv();
		my Str $decrypted = '';
		#$decrypted = decrypt($recvd, $certificate.getKey(), $certificate.getAlg());
		
		return LWPsix::Response.new($decrypted);
	}

	method kill() {
		$.sock.close();
	}
}

