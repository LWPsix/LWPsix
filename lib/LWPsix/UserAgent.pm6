use v6;
use LWPsix::Protocol;

class LWPsix::UserAgent {
    # Wouldn't it make more sense for a UserAgent to have one protocol, and the
    # user to make different agents for different protocols? Not even a little
    # bit.
    my LWPsix::Protocol %!protocols;

    method new() {
        self.bless(*);
        # TODO: populates protocols according to parameters
    }

    # TODO: accept arbitrary params
    method request(Str $url) returns LWPsix::Response {
        ...
        my Str ($scheme, $path) = $url.split: <:>, 2;
        # TODO: error-check the above
        my LWPsix::Protocol $proto = %!protocols{$scheme};
        # TODO: error-check the above
        return $proto.request: $path;
    }
}
