use t::CompileTestLib;
use NativeCall;

say "1..9";

compile_test_lib('02-simple-args');

# Int related
sub TakeInt(int32) is native('02-simple-args') { * }
sub TakeTwoShorts(int16, int16) is native('02-simple-args') { * }
sub AssortedIntArgs(int32, int16, int8) is native('02-simple-args') { * }
TakeInt(42);
TakeTwoShorts(10, 20);
AssortedIntArgs(101, 102, 103);

# Float related
sub TakeADouble(num64) is native('02-simple-args') { * }
sub TakeAFloat(num32) is native('02-simple-args') { * }
TakeADouble(-6.9e0);
TakeAFloat(4.2e0);

# String related
sub TakeAString(Str) is native('02-simple-args') { * }
TakeAString('ok 9 - passed a string');
