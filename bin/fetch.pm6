use v6;
use LWPsix::UserAgent;

sub MAIN(Str $url, Bool :$post = False) {
    my $ua = LWP::UserAgent.new;
    my $resp = $ua.request($url);

    # TODO: check status & stuff; print results

    # TODO: MOAR options
}
