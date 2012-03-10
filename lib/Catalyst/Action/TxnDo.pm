package Catalyst::Action::TxnDo;

use Moose;

extends 'Catalyst::Action';
with 'Catalyst::ActionRole::TxnDo';

no Moose;

1;

