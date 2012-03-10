package Foo::Controller::Bar;
use Moose;

BEGIN { extends 'Catalyst::Controller::ActionRole' }

__PACKAGE__->config(
   namespace => '',
   'Catalyst::ActionRole::TxnDo' => { model => 'DB' },
);

sub controller : Local Does('TxnDo') {
   $_[1]->response->body('txn: ' . $_[1]->model('DB')->schema->in_txn)
}

sub base : Chained('/') PathPart('') CaptureArgs(0) Does('TxnDo') {
   $_[1]->response->body('txn: ' . $_[1]->model('DB')->schema->in_txn)
}

sub chained : Chained('base') PathPart('chained') Args(0) Does('TxnDo'){
   $_[1]->response->body($_[1]->response->body . ', txn: ' . $_[1]->model('DB')->schema->in_txn)
}


__PACKAGE__->meta->make_immutable;

1;
