
package Net::SSLeay::X509::Context;

# wrapper for X509_STORE_CTX* functions
#
# Copyright (C) 2009  NZ Registry Services
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the Artistic License 2.0 or later.  You should
# have received a copy of the Artistic License the file COPYING.txt.
# If not, see <http://www.perlfoundation.org/artistic_license_2_0>

use Moose;

has 'x509_store_ctx' => isa => 'Int',
	is           => "ro",
	required     => 1,
	;

sub get_current_cert {
	my $self = shift;
	my $x509 = Net::SSLeay::X509_STORE_CTX_get_current_cert(
		$self->x509_store_ctx, );
	&Net::SSLeay::Error::die_if_ssl_error("get_current_cert");
	if ($x509) {
		require Net::SSLeay::X509;
		Net::SSLeay::X509->new( x509 => $x509, no_rvinc => 1 );
	}
}

# getting all these right is made harder by the lack of OpenSSL docs
# for these methods...

use Net::SSLeay::Functions 'x509_store_ctx';

# un-triaged:
#   get_error()
#   get_error_depth()
#   get_ex_data()
#   set_cert()
#   set_error()
#   set_ex_data()
#   set_flags()

1;

__END__

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
