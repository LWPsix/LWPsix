use v6;
use Test;
plan 47;

use URI;
ok(1,'We use URI and we are still alive');

my $u = URI.new('http://example.com:80/about/us?foo#bar');

is($u.scheme, 'http', 'scheme');

is($u.host, 'example.com', 'host');
is($u.port, '80', 'port');
is($u.path, '/about/us', 'path');
is($u.query, 'foo', 'query');
is($u.frag, 'bar', 'frag');
is($u.segments, 'about us', 'segements');
is($u.segments[0], 'about', 'first chunk');
is($u.segments[1], 'us', 'second chunk');

is( ~$u, 'http://example.com:80/about/us?foo#bar',
    'Complete path stringification');

# allow uri as named argument too
$u = URI.new(uri => 'https://eXAMplE.COM');

is($u.scheme, 'https', 'scheme');
is($u.host, 'example.com', 'host');
is( "$u", 'https://example.com',
    'https://eXAMplE.COM stringifies to https://example.com');
is($u.port, 443, 'default https port');
ok(! $u._port.defined, 'no specified port');

$u.parse('/foo/bar/baz');

is($u.segments, 'foo bar baz', 'segments from absolute path');
ok($u.absolute, 'absolute path');
nok($u.relative, 'not relative path');

$u.parse('foo/bar/baz');

is($u.segments, 'foo bar baz', 'segements from relative path');
ok( $u.relative, 'relative path');
nok($u.absolute, 'not absolute path');

is($u.segments[0], 'foo', 'first segment');
is($u.segments[1], 'bar', 'second segment');
is($u.segments[*-1], 'baz', 'last segment');

# actual uri parameter not required
$u = URI.new;
$u.parse('http://foo.com');

ok($u.segments == 1 && $u.segments[0] eq '', ".segments return [''] for empty path");
ok($u.absolute, 'http://foo.com has an absolute path');
nok($u.relative, 'http://foo.com does not have a relative path');
is($u.port, 80, 'default http port');

# test URI parsing with <> or "" and spaces
$u.parse("<http://foo.com> ");
is("$u", 'http://foo.com', '<> removed from str');

$u.parse(' "http://foo.com"');
is("$u", 'http://foo.com', '"" removed from str');
my $host_in_grammar =
    $u.grammar.parse_result<URI_reference><URI><hier_part><authority><host>;
ok(! $host_in_grammar<IPv4address>.defined, 'grammar detected host not ip'
);
is($host_in_grammar<reg_name>, 'foo.com', 'grammar detected registered domain style');

$u.parse('http://10.0.0.1');
is($u.host, '10.0.0.1', 'numeric host');
$host_in_grammar =
    $u.grammar.parse_result<URI_reference><URI><hier_part><authority><host>;

is($host_in_grammar<IPv4address>, '10.0.0.1', 'grammar detected ipv4');
ok(! $host_in_grammar<reg_name>.defined, 'grammar detected no registered domain style');

$u.parse('http://example.com:80/about?foo=cod&bell=bob#bar');
is($u.query, 'foo=cod&bell=bob', 'query with form params');
is($u.query_form<foo>, 'cod', 'query param foo');
is($u.query_form<bell>, 'bob', 'query param bell');

$u.parse('http://example.com:80/about?foo=cod&foo=trout#bar');
is($u.query_form<foo>[0], 'cod', 'query param foo - el 1');
is($u.query_form<foo>[1], 'trout', 'query param foo - el 2');
is($u.frag, 'bar', 'test query and frag capture');

$u.parse('http://example.com:80/about?foo=cod&foo=trout');
is($u.query_form<foo>[1], 'trout', 'query param foo - el 2 without frag');

$u.parse('about/perl6uri?foo=cod&foo=trout#bar');
is($u.query_form<foo>[1], 'trout', 'query param foo - el 2 relative path');

$u.parse('about/perl6uri?foo=cod&foo=trout');
is($u.query_form<foo>[1], 'trout', 'query param foo - el 2 relative path without frag');

my ($url_1_valid, $url_2_valid) = (1, 1);
try {
    my $u_v = URI.new('http:://www.perl.com', :is_validating<1>);
    is($url_1_valid, 1, 'validating parser okd good URI');
    $u_v = URI.new('http:://?#?#', :is_validating<1>);
    CATCH {
        default { $url_2_valid = 0 }
    }
}
is($url_2_valid, 0, 'validating parser rejected bad URI');
# vim:ft=perl6
