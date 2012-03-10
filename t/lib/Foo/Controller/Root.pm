package Foo::Controller::Root;
use Moose;

BEGIN { extends 'Catalyst::Controller::ActionRole' }

__PACKAGE__->config(namespace => '');

sub basic : Local Does('TxnDo') TDModel('DB') {
   $_[1]->response->body('txn: ' . $_[1]->model('DB')->schema->in_txn)
}

sub use_action_class : Local ActionClass('TxnDo') TDModel('DB') {
   $_[1]->response->body('txn: ' . $_[1]->model('DB')->schema->in_txn)
}

__PACKAGE__->meta->make_immutable;

1;
