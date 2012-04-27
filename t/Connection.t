use v6;
use LWP::ConcreteConnection;


my $host = 'localhost';
my $port = 1337;

my $con = ConcreteConnection.new(:$host, :$port);
say $con;
