use t::CompileTestLib;
use NativeCall;
use Test;

plan 7;

compile_test_lib('05-arrays');

{
    sub ReturnADoubleArray() returns CArray[num] is native("05-arrays") { * }
    my @rarr := ReturnADoubleArray();
    is_approx @rarr[0], 23.45e0, 'returning double array (1)';
    is_approx @rarr[1], -99.87e0, 'returning double array (2)';
    is_approx @rarr[2], 0.25e0, 'returning double array (3)';

    sub TakeADoubleArrayAndAddElements(CArray[num]) returns num is native("05-arrays") { * }
    my @parr := CArray[num].new();
    @parr[0] = 9.5e0;
    @parr[1] = 32.5e0;
    is_approx TakeADoubleArrayAndAddElements(@parr), 42e0, 'passing double array';
}

{
    sub ReturnAStringArray() returns CArray[Str] is native("05-arrays") { * }
    my @rarr := ReturnAStringArray();
    is @rarr[0], 'La Trappe', 'returning string array (1)';
    is @rarr[1], 'Leffe', 'returning string array (2)';
    
    sub TakeAStringArrayAndReturnTotalLength(CArray[Str]) returns int32 is native("05-arrays") { * }
    my @parr := CArray[Str].new();
    @parr[0] = "OMG";
    @parr[1] = "strings!!!";
    is TakeAStringArrayAndReturnTotalLength(@parr), 13, 'passing string array';
}
