#!/usr/bin/perl -w
#
#  t/02-context.t - test the Net::SSLeay::OO::Context binding
#
# Copyright (C) 2009  NZ Registry Services
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the Artistic License 2.0 or later.  You should
# have received a copy of the Artistic License the file COPYING.txt.
# If not, see <http://www.perlfoundation.org/artistic_license_2_0>

use strict;
use Test::More qw(no_plan);

use Net::SSLeay::OO::Context;

use Net::SSLeay::OO::Constants qw(OP_ALL VERIFY_NONE FILETYPE_PEM);

my $default_paths_set;
{
	no warnings 'redefine';
	*Net::SSLeay::OO::Context::set_default_verify_paths = sub {
		$default_paths_set = 1;
	};
}

$default_paths_set = 0;
my $ctx1 = Net::SSLeay::OO::Context->new();
is($default_paths_set,1,"default paths set when not specified");

$default_paths_set = 0;
my $ctx2 = Net::SSLeay::OO::Context->new(
	use_default_verify_paths => 1,
);
is($default_paths_set,1,"default paths set when explicitly requested");

$default_paths_set = 0;
my $ctx3 = Net::SSLeay::OO::Context->new(
	use_default_verify_paths => 0,
);
is($default_paths_set,0,"default paths not set when explicitly not requested");


# Local Variables:
# mode:cperl
# indent-tabs-mode: t
# cperl-continued-statement-offset: 8
# cperl-brace-offset: 0
# cperl-close-paren-offset: 0
# cperl-continued-brace-offset: 0
# cperl-continued-statement-offset: 8
# cperl-extra-newline-before-brace: nil
# cperl-indent-level: 8
# cperl-indent-parens-as-block: t
# cperl-indent-wrt-brace: nil
# cperl-label-offset: -8
# cperl-merge-trailing-else: t
# End:
# vim: filetype=perl:noexpandtab:ts=3:sw=3
