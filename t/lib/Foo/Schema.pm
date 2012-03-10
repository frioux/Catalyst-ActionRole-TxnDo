package Foo::Schema;

use parent 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces();

__PACKAGE__->mk_group_accessors(simple => qw(in_txn));

sub txn_do {
   my ($self, $code) = @_;
   $self->in_txn($self->in_txn + 1);
   $code->();
   $self->in_txn($self->in_txn - 1);
}

1;
