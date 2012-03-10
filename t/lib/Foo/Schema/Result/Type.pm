package Foo::Schema::Result::Type;

use strict;
use warnings;

use parent 'DBIx::Class::Core';

__PACKAGE__->table('types');
__PACKAGE__->add_columns(

   id => {
      data_type => 'int',
      is_auto_increment => 1,
   },

   name => {
      data_type => 'varchar',
      size      => 32,
   },

);

__PACKAGE__->set_primary_key('id');

1;
