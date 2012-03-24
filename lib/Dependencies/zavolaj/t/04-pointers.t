use t::CompileTestLib;
use NativeCall;

say("1..1");

compile_test_lib('04-pointers');

sub ReturnSomePointer() returns OpaquePointer is native("04-pointers") { * }
sub TakeSomePointer(OpaquePointer) is native("04-pointers") { * }
my $x = ReturnSomePointer();
TakeSomePointer($x);
