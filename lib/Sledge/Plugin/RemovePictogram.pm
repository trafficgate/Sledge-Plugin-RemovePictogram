package Sledge::Plugin::RemovePictogram;

use strict;
use vars qw($VERSION);
$VERSION = 0.02;

use HTML::Entities::ImodePictogram;

sub import {
    my $class = shift;
    my $pkg   = caller;
    $pkg->register_hook(
	AFTER_INIT => sub {
	    my $self = shift;
	    for my $key ($self->r->param) {
		my @v = map do_remove($_), $self->r->param($key);
		$self->r->param($key => \@v);
	    }
	},
    );
}

sub do_remove {
    my $str = shift;
    if ($ENV{USER_AGENT} =~ /^DoCoMo/) {
	$str = remove_pictogram($str);
    } elsif ($ENV{USER_AGENT} =~ /-J-PHONE/) {
	$str =~ s/\x1B\$(.+?)\x0F//g;
    }
    return $str;
}

1;
__END__

=head1 NAME

Sledge::Plugin::RemovePictogram - remove HTML pictogram by i-mode and J-PHONE agents

=head1 SYNOPSIS

  use Sledge::Plugin::RemovePictogram;

=head1 DESCRIPTION

Sledge::Plugin::RemovePictogram はiモードおよびJ-PHONE端末の絵文字入力
を削除するプラグインです。

=head1 AUTHOR

Tatsuhiko Miyagawa E<lt>miyagawa@edge.jpE<gt>

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<HTML::Entities::ImodePictogram>

=cut
