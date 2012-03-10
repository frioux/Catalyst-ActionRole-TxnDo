package Foo2::Controller::Root;
use Moose;

BEGIN { extends 'Catalyst::Controller::ActionRole' }

__PACKAGE__->config(namespace => '');

sub basic : Local Does('TxnDo') {
   $_[1]->response->body('txn: ' . $_[1]->model('DB')->schema->in_txn)
}

__PACKAGE__->meta->make_immutable;

1;
