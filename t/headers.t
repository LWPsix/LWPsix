use v6;

use LWP::Headers;
use Test;

plan 4;

### COOKIE, COOKIEJAR
{
	#my $dat = "Name=example; Expires=Tue, 01 May 2012 15:30:30 GMT; Domain=LWPsixdemo.com;"
	#my $cj = CookieJar.new();
	#my $ck = Cookie.new();
	#$ck.parse($dat);
	#lives_ok { $cj.addCookie( cookie => $ck, domain => "LWPsixdemo.com")}, 'Adding cookie to jar successful';
	#my $cjs = $cj.serializeAllData();
	#is $cjs ~~ Str, True, 'Data serialize works';
	#my $cj2 = CookieJar.new();
	#lives_ok { $cj2.deserializeData($cjs)}, 'recreating CookieJar from serialized string successful';

}

### IDENTITY, IDENTITYMAKER, DIGESTAUTHIDENTITY, BASICAUTHIDENTITY
{
	my $idn = IdentityMaker.make(sec => False, un => "example", pw => "hunter2");
	
	lives_ok { IdentityMaker.parseMake($idn.raw())}, 'Recreate BasicAuthIdentity from raw string dump';
	lives_ok { IdentityMaker.make(sec => True, un => "IMSecure", pw => "safety")}, 'Can create DigestAuthIdentity';
	lives_ok { IdentityMaker.make(sec => False, un => "Insecure", pw = "stealme")}, 'Can create BasicAuthIdentity';

	dies_ok { IdentityMaker.make(sec => "make me secure", un => "un", pw =>"pw")}, 'Bool expected for $sec argument';
}

### CREDENTIALCACHE
{
	


}
