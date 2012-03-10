package Catalyst::ActionRole::TxnDo;
use Moose::Role;

use Carp 'croak';

# ABSTRACT: If something dies in a chain, stop the chain

sub _get_model {
   my ($self, $controller, $c) = @_;

   $self->attributes->{TDModel}[0]
      || $controller->config->{'Catalyst::ActionRole::TxnDo'}{model}
      || $c->config->{'Catalyst::ActionRole::TxnDo'}{model}
      || die 'no model defined for TxnDo!'
}

around execute => sub {
   my ($orig, $self, $controller, $c, @args) = @_;

   $c->model($self->_get_model($controller, $c))
      ->schema
      ->txn_do(sub {
         $self->$orig($controller, $c, @args)
      })
};

no Moose::Role;

1;

