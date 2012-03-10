#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use lib 't/lib';

use Catalyst::Test 'Foo';

is( get('/basic'), 'txn: 1', 'txn started');
is( get('/use_action_class'), 'txn: 1', 'action_class works too');
is( get('/controller'), 'txn: 1', 'model set from controller');
is( get('/chained'), 'txn: 1, txn: 2', 'chaining correctly nests txn');

done_testing();
