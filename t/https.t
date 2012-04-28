use v6;
use Test;
use LWPsix::HttpsProtocol;

say "running HTTPS test suite..."
my LWPsix::HttpsProtocol $proto .= new(); # no args for now

