use v6;
use LWPsix::UserAgent;

# Demo

my $host = prompt "URL: ";

my $ua = LWP::UserAgent.new; # default useragent with just HttpProtocol
my $resp = $ua.request("http://google.com/");

# TODO: print out headers/results of response

$resp = $ua.request("GET", "http://google.com/");

# TODO: request decorators/response examiners

# TODO: MOAR protocols
Proxy
HTTPs

$ua = LWP::UserAgent.new: 

# TODO: pipe to lynx
say $resp;
						

# TODO: download utility

