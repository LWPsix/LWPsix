use v6;

use LWP::Headers;
use Test;

plan 7;

### COOKIEJAR
{
	my $dat = "Name=example; Expires=Tue, 01 May 2012 15:30:30 GMT; Domain=LWPsixdemo.com;"


}

### CREDENTIALCACHE
{
	


}

### IDENTITYMAKER
{
	my $idn = IdentityMaker.make(sec => False, un => "example", pw => "hunter2");
	
	lives_ok { IdentityMaker.parseMake($idn.raw())}, 'Recreate BasicAuthIdentity from raw string dump';
	lives_ok { IdentityMaker.make(sec => True, un => "IMSecure", pw => "safety")}, 'Can create DigestAuthIdentity';
	lives_ok { IdentityMaker.make(sec => False, un => "Insecure", pw = "stealme")}, 'Can create BasicAuthIdentity';

	dies_ok { IdentityMaker.make(sec => "make me secure", un => "un", pw =>"pw")}, 'Bool expected for $sec argument';
}