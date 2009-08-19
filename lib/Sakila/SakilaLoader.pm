package My::Schema;
use base qw/DBIx::Class::Schema::Loader/;

__PACKAGE__->loader_options(
      constraint              => '^foo.*',
      # debug                 => 1,
  );

__PACKAGE__->dump_to_dir("$ENV{SAKILA}/DBIx/Class");

