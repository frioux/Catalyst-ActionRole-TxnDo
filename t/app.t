#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use lib 't/lib';

use Catalyst::Test 'Foo2';

is( get('/basic'), 'txn: 1', 'app level config works');

done_testing();
