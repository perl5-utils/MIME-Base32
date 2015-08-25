use strict;
use warnings;
use Test::More;

use FindBin;
use lib "$FindBin::Bin/lib";

BEGIN {
	use_ok( 'MIME::Base32' ) || print "Bail out!\n";
}

my $string = 'Hallo world, whats new? 1234567890 abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ .:!%$@#*()[]{}<>"/ ';
my $encoded_rfc = 'JBQWY3DPEB3W64TMMQWCA53IMF2HGIDOMV3T6IBRGIZTINJWG44DSMBAMFRGGZDFMZTWQ2LKNNWG23TPOBYXE43UOV3HO6DZPIQECQSDIRCUMR2IJFFEWTCNJZHVAUKSKNKFKVSXLBMVUIBOHIQSKJCAEMVCQKK3LV5X2PB6EIXSA';
my $encoded_09AV = '91GMOR3F41RMUSJCCGM20TR8C5Q7683ECLRJU81H68PJ8D9M6SS3IC10C5H66P35CPJMGQBADDM6QRJFE1ON4SRKELR7EU3PF8G42GI38H2KCHQ89554MJ2D9P7L0KAIADA5ALINB1CLK81E78GIA9204CL2GAARBLTNQF1U48NI0';

is(MIME::Base32::encode_rfc3548($string),$encoded_rfc, 'Properly encoded according to RFC-3548');
is(MIME::Base32::decode_rfc3548($encoded_rfc),$string, 'Properly decoded according to RFC-3548');
is(MIME::Base32::encode_09AV($string),$encoded_09AV, 'Properly encoded according to the old 09AV method');
is(MIME::Base32::decode_09AV($encoded_09AV),$string, 'Properly decoded according to the old 09AV method');
done_testing();
