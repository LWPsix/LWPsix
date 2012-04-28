use t::CompileTestLib;
use NativeCall;

say "1..2";

compile_test_lib('01-argless');

sub Argless() is native('01-argless') { * }

# This emits the "ok 1"
Argless();

say("ok 2 - survived the call");
