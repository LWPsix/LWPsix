class Cookie {
    has Str $.name = die "'name' field required";
    has Str $.value;
    has Str $.path;
    has DateTime $.expires;
    has Bool $.http_only;
    has Bool $.secure;
    # XXX: Cookie's don't have domains - domains have cookies

    method ^parse(Str $header) {
        # parse ALL the things
        return Cookie.new(...);
    }

    method Str {
        # serialize; output should be parse-compatible
    }
}
