use strict;
use warnings;
use Test::More;

BEGIN {
	use_ok( 'MIME::Base32', 'rfc' ) || BAIL_OUT("Can't use MIME::Base32");
}
can_ok('MIME::Base32', (
	qw(encode decode),
	qw(encode_base32 decode_base32),
	qw(encode_rfc3548 decode_rfc3548),
)) or BAIL_OUT("Something's wrong with the module!");

my $string = 'Hallo world, whats new? 1234567890 abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ .:!%$@#*()[]{}<>"/ ';
my $encoded = 'JBQWY3DPEB3W64TMMQWCA53IMF2HGIDOMV3T6IBRGIZTINJWG44DSMBAMFRGGZDFMZTWQ2LKNNWG23TPOBYXE43UOV3HO6DZPIQECQSDIRCUMR2IJFFEWTCNJZHVAUKSKNKFKVSXLBMVUIBOHIQSKJCAEMVCQKK3LV5X2PB6EIXSA';

is(MIME::Base32::encode($string),$encoded, 'encode: got the correct response');
is(MIME::Base32::decode($encoded),$string, 'decode: got the correct response');

is(MIME::Base32::encode_base32($string),$encoded, 'encode_base32: got the correct response');
is(MIME::Base32::decode_base32($encoded),$string, 'decode_base32: got the correct response');

is(MIME::Base32::encode_rfc3548($string),$encoded, 'encode_rfc3548: got the correct response');
is(MIME::Base32::decode_rfc3548($encoded),$string, 'decode_rfc3548: got the correct response');

done_testing();
