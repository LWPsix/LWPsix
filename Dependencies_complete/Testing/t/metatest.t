#! /Users/damian/bin/rakudo*
use v6;

use Testing;

COMM "\nBasic tests...";
OK   1,      1,                :desc<Number match>;
OK   'a',    'a',              :desc<String match>;
OK   'foo',  /fo+/,            :desc<Regex match>;
OK   5,      1..10,            :desc<Range match>;
OK   5,      { $_ == 5 },      :desc<Block match>;
OK   5,      { 4 < $^n < 6 },  :desc<Placeholder match>;
OK   5,      *,                :desc<Whatever match>;
OK   5,      * < 10,           :desc<WhateverCode match>;

COMM "\nNegative tests...";
OK  have =>     1, want => none( 2               ), :desc<Number mismatch>;
OK  have =>   'a', want => none( 'b'             ), :desc<String mismatch>;
OK  have => 'foo', want => none( /fo+d/          ), :desc<Regex mismatch>;
OK  have =>    15, want => none( 1..10           ), :desc<Range mismatch>;
OK  have =>    15, want => none( { $_ == 5 }     ), :desc<Block mismatch>;
OK  have =>    15, want => none( { 4 < $^n < 6 } ), :desc<Placeholder mismatch>;
OK  have =>    15, want => none( * < 10          ), :desc<WhateverCode mismatch>;

COMM "\nOne-arg negative tests...";
OK      1 !~~ 2,                 :desc<Number mismatch>;
OK    'a' !~~ 'b',               :desc<String mismatch>;
OK  'foo' !~~ /fo+d/,            :desc<Regex mismatch>;
OK     15 !~~ 1..10,             :desc<Range mismatch>;
OK     15 !~~ { $_ == 5 },       :desc<Block mismatch>;
OK     15 !~~ { 4 < $^n < 6 },   :desc<Placeholder mismatch>;
OK     15 !~~ * < 10,            :desc<WhateverCode mismatch>;

COMM "\nTest skipping behaviour...";
OK  'a', 'b',       :desc<Skipping>,          :SKIP<Test of 2-arg OK skipping>;
OK  'a' !~~ 'a',    :desc<Skipping>,          :SKIP<Test of 1-arg OK skipping>;

COMM "\nTest todo behaviour...";
OK   'a', 'a',      :desc<ToDoing matching>,       :TODO<Test of todoing>;
OK   'a', 'b',      :desc<ToDoing failing>,        :TODO<Test of todoing>;
OK  'a' !~~ 'b',    :desc<ToDoing 1-arg failing>,  :TODO<Test of todoing>;
OK  'a' !~~ 'a',    :desc<ToDoing 1-arg matching>, :TODO<Test of todoing>;


COMM "\nTest named args...";
OK   :want(1),         :have(1),           :desc<Naming want and have>;
OK   :have<x>,         :want('y'),         :desc<Reversed names>, :TODO;
