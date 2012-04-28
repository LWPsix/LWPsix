use v6;
use LWP::ConcreteConnection;


my Str $host = 'localhost';
my Int $port = 1337;

my $con = ConcreteConnection.new($host, $port);
say $con;
