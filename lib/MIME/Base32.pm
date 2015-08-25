package MIME::Base32;

use 5.006;
use strictures 2;

our $VERSION = '1.03_001';
$VERSION = eval $VERSION;

sub import {
	my( $pkg, $arg )=@_;
	if( defined($arg) && $arg =~ /rfc|3548/i )
	{
		*encode = \&encode_rfc3548;
		*decode = \&decode_rfc3548;
	}
	else
	{
		*encode = \&encode_09AV;
		*decode = \&decode_09AV;
	}
}

sub encode_rfc3548 {
	# base32:
	#
	#  modified base64 algorithm with
	#  32 characters set:  A - Z 2 - 7 compliant with: RFC-3548
	#


	$_ = shift @_;
	my( $buffer, $l, $e );

	$_=unpack('B*', $_);
	s/(.....)/000$1/g;
	$l=length;
	if ($l & 7)
	{
		$e = substr($_, $l & ~7);
		$_ = substr($_, 0, $l & ~7);
		$_ .= "000$e" . '0' x (5 - length $e);
	}
	$_=pack('B*', $_);
	tr|\0-\37|A-Z2-7|;
	$_;
}

sub decode_rfc3548 {
	$_ = shift;
	my( $l );

	tr|A-Z2-7|\0-\37|;
	$_=unpack('B*', $_);
	s/000(.....)/$1/g;
	$l=length;

	# pouzije pouze platnou delku retezce
	$_=substr($_, 0, $l & ~7) if $l & 7;

	$_=pack('B*', $_);
}

sub encode_09AV {

	# base32:
	#
	#  modified base64 algorithm with
	#  32 characters set:  [0-9A-V] pre 1.00 backward compatibility
	#


	$_ = shift @_;
	my( $buffer, $l, $e );

	$_=unpack('B*', $_);
	s/(.....)/000$1/g;
	$l=length;
	if ($l & 7)
	{
		$e = substr($_, $l & ~7);
		$_ = substr($_, 0, $l & ~7);
		$_ .= "000$e" . '0' x (5 - length $e);
	}
	$_=pack('B*', $_);
	tr|\0-\37|0-9A-V|;
	$_;
}

sub decode_09AV {
	$_ = shift;
	my( $l );

	tr|0-9A-V|\0-\37|;
	$_=unpack('B*', $_);
	s/000(.....)/$1/g;
	$l=length;

	# pouzije pouze platnou delku retezce
	$_=substr($_, 0, $l & ~7) if $l & 7;

	$_=pack('B*', $_);
}
1;

=encoding utf8

=head1 NAME

MIME::Base32 - Base32 encoder and decoder

=head1 SYNOPSIS

	#!/usr/bin/env perl
	use strict;
	use warnings;
	use MIME::Base32;

	# the old 09AV standard for MIME::Base32 prior to version 1.0
	my $encoded_09AV = MIME::Base32::encode($text_or_binary_data);
	my $decoded_09AV = MIME::Base32::decode($encoded_09AV);
	# synonymous to:
	$encoded_09AV = MIME::Base32::encoded_09AV($text_or_binary_data);
	$decoded_09AV = MIME::Base32::decoded_09AV($encoded_09AV);

	# the RFC3548 compliant way!
	my $encoded = MIME::Base32::encode_rfc3548($text_or_binary_data);
	my $decoded = MIME::Base32::decode_rfc3548($encoded);

=head1 DESCRIPTION

This module is for encoding/decoding data much the way that L<MIME::Base64> does.

Prior to version 1.0, L<MIME::Base32> used the older C<[0-9A-V]> encoding and
decoding methods. So, keeping with that, L<MIME::Base32::encode> will be a synonym
to L<MIME::Base32::encode_09AV> and L<MIME::Base32::decode> will be a synonym
to L<MIME::Base32::decode_09AV> unless you explicitly request L<RFC-3548 Compliance|https://tools.ietf.org/html/rfc3548#section-5>
by importing the module with C<use MIME::Base32 qw(RFC);>.

=head1 METHODS

=head2 decode

	my $string_or_binary_data = MIME::Base32::decode($encoded_data);

Decode some encoded data back into a string of text or binary data.  By default, this is a synonym for L<MIME::Base32::decode_09AV>.
Change the default behavior to L<RFC-3548 Compliance|https://tools.ietf.org/html/rfc3548#section-5> by
using the module with C<use MIME::Base32 qw(RFC)>.

=head2 decode_09AV

	my $string_or_binary_data = MIME::Base32::decode_09AV($encoded_data);

Decode some encoded data back into a string of text or binary data. This uses the C<[0-9A-V]> method.

=head2 decode_rfc3548

	my $string_or_binary_data = MIME::Base32::decode_rfc3548($encoded_data);

Decode some encoded data back into a string of text or binary data. This uses the C<[A-Z2-7]> L<RFC-3548 Compliant|https://tools.ietf.org/html/rfc3548#section-5> method.

=head2 encode

	my $encoded = MIME::Base32::encode("some string");

Encode a string of text or binary data.  By default, this is a synonym for L<MIME::Base32::encode_09AV>.
Change the default behavior to L<RFC-3548 Compliance|https://tools.ietf.org/html/rfc3548#section-5> by
using the module with C<use MIME::Base32 qw(RFC)>.

=head2 encode_09AV

	my $encoded = MIME::Base32::encode_09AV("some string");

Encode a string of text or binary data. This uses the C<[0-9A-V]> method.

=head2 encode_rfc3548

	my $encoded = MIME::Base32::encode_rfc3548("some string");

Encode a string of text or binary data. This uses the C<[A-Z2-7]> L<RFC-3548 Compliant|https://tools.ietf.org/html/rfc3548#section-5> method.

=head1 AUTHOR

Daniel Peder, sponsored by Infoset s.r.o., Czech Republic
<Daniel.Peder@InfoSet.COM> http://www.infoset.com

Chase Whitener <cwhitener@gmail.com>

=head1 BUGS

Please report any bugs or feature requests on GitHub L<https://github.com/genio/p5-mime-base32/issues>.
Any and all criticism, bug reports, enhancements, fixes, etc. are appreciated.

=head1 COPYRIGHT AND LICENSE INFORMATION

Copyright (c) 2003-2010 Daniel Peder.  All rights reserved.

This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=head1 SEE ALSO

L<MIME::Base64>, L<RFC-3548|https://tools.ietf.org/html/rfc3548#section-5>

=cut
