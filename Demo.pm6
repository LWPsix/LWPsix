use v6;

# Demo

my $host = prompt "Host: ";
my $port = prompt "Port: ";

my $ua = UserAgent.new(); # default useragent with just HttpProtocol
my $resp = $ua.request("http://google.com/");

# TODO: print out headers/results of response

$resp = $ua.request("GET", "http://google.com/");

# TODO: request decorators/response examiners

# TODO: MOAR protocols
