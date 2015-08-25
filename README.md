# MIME::Base32 [![Build Status](https://travis-ci.org/genio/p5-mime-base32.svg?branch=master)](https://travis-ci.org/genio/p5-mime-base32)

A Base32 encoder/decoder.

## SYNOPSIS
```perl
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
```

## DESCRIPTION
This module is for encoding/decoding data much the way that [MIME::Base64](https://metacpan.org/pod/MIME::Base64) does.

Prior to version 1.0, [MIME::Base32](https://github.com/genio/p5-mime-base32) used the older ```[0-9A-V]``` encoding and decoding methods. So, keeping with that, [MIME::Base32::encode](#encode) will be a synonym to [MIME::Base32::encode_09AV](#encode_09AV) and [MIME::Base32::decode](#encode) will be a synonym to [MIME::Base32::decode_09AV](#decode_09AV) unless you explicitly request [RFC-3548 Compliance](https://tools.ietf.org/html/rfc3548#section-5) by importing the module with ```use MIME::Base32 qw(RFC);```

## METHODS

### decode

```perl
my $string_or_binary_data = MIME::Base32::decode($encoded_data);
```

Decode some encoded data back into a string of text or binary data.  By default, this is a synonym for [MIME::Base32::decode_09AV](#decode_09AV).
Change the default behavior to [RFC-3548 Compliance](https://tools.ietf.org/html/rfc3548#section-5) by using the module with ```use MIME::Base32 qw(RFC);```.

### decode_09AV

```perl
my $string_or_binary_data = MIME::Base32::decode_09AV($encoded_data);
```

Decode some encoded data back into a string of text or binary data. This uses the ```[0-9A-V]``` method.

### decode_rfc3548

```perl
my $string_or_binary_data = MIME::Base32::decode_rfc3548($encoded_data);
```
Decode some encoded data back into a string of text or binary data. This uses the ```[A-Z2-7]``` [RFC-3548 Compliant](https://tools.ietf.org/html/rfc3548#section-5) method.

### encode

```perl
my $encoded = MIME::Base32::encode("some string");
```

Encode a string of text or binary data.  By default, this is a synonym for [MIME::Base32::encode_09AV](#encode_09AV).
Change the default behavior to [RFC-3548 Compliance](https://tools.ietf.org/html/rfc3548#section-5) by
using the module with ```use MIME::Base32 qw(RFC);```.

### encode_09AV

```perl
my $encoded = MIME::Base32::encode_09AV("some string");
```

Encode a string of text or binary data. This uses the ```[0-9A-V]``` method.

### encode_rfc3548

```perl
my $encoded = MIME::Base32::encode_rfc3548("some string");
```

Encode a string of text or binary data. This uses the ```[A-Z2-7]``` [RFC-3548 Compliant](https://tools.ietf.org/html/rfc3548#section-5) method.


## AUTHOR

Daniel Peder, sponsored by [Infoset s.r.o.](http://www.infoset.com), Czech Republic
<Daniel.Peder@InfoSet.COM> [Infoset s.r.o.](http://www.infoset.com)

Chase Whitener <cwhitener@gmail.com>

## COPYRIGHT AND LICENSE INFORMATION

Copyright (c) 2003-2010 Daniel Peder.  All rights reserved.

This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

##SEE ALSO

[MIME::Base64](https://metacpan.org/pod/MIME::Base64), [RFC-3548](https://tools.ietf.org/html/rfc3548#section-5)
