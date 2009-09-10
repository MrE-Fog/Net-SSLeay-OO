
package Net::SSLeay::X509::Store;

use Moose;

has 'x509_store' =>
	isa => 'Int',
	is => "ro",
	required => 1,
	;

use Net::SSLeay::Functions 'x509_store';

# add_cert()
# add_crl()
# set_flags()
# set_purpose()
# set_trust()

1;

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
