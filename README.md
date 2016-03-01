# MIME::Base32 [![Build Status](https://travis-ci.org/perl5-utils/MIME-Base32.svg?branch=master)](https://travis-ci.org/perl5-utils/MIME-Base32)

Base32 encoder and decoder

## SYNOPSIS

```perl
#!/usr/bin/env perl
use strict;
use warnings;
use MIME::Base32;

my $encoded = encode_base32('Aladdin: open sesame');
my $decoded = decode_base32($encoded);
```

## DESCRIPTION

This module is for encoding/decoding data much the way that [MIME::Base64](https://metacpan.org/pod/MIME::Base64) does.

Prior to version 1.0, [MIME::Base32](https://github.com/genio/p5-mime-base32) used the ```base32hex``` (or ```[0-9A-V]```) encoding and decoding methods by default. If you need to maintain that behavior, please call [encode_base32hex](#encode_base32hex) or [decode_base32hex](#decode_base32hex) functions directly.

Now, in accordance with [RFC-3548, Section 6](https://tools.ietf.org/html/rfc3548#section-6),
[MIME::Base32](https://github.com/genio/p5-mime-base32) uses the [encode_base32](#encode_base32) and [decode_base32](#decode_base32) functions by default.

Many synonyms to each function remain due to this change.

## FUNCTIONS

The following primary functions are provided:

### decode

Synonym for [decode_base32](#decode_base32)

### decode_rfc3548

Synonym for [decode_base32](#decode_base32)

### decode_base32

```perl
my $string = decode_base32($encoded_data);
```

Decode some encoded data back into a string of text or binary data.

### decode_09AV

Synonym for [decode_base32hex](#decode_base32hex)

### decode_base32hex

```perl
my $string_or_binary_data = MIME::Base32::decode_base32hex($encoded_data);
```

Decode some encoded data back into a string of text or binary data.

### encode

Synonym for [encode_base32](#encode_base32)

### encode_rfc3548

Synonym for [encode_base32](#encode_base32)

### encode_base32

```perl
my $encoded = encode_base32("some string");
```

Encode a string of text or binary data.

### encode_09AV

Synonym for [encode_base32hex](#encode_base32hex)

### encode_base32hex

```perl
my $encoded = MIME::Base32::encode_base32hex("some string");
```

Encode a string of text or binary data. This uses the ```hex``` (or ```[0-9A-V]```) method.

## AUTHOR

Daniel Peder, sponsored by Infoset s.r.o., Czech Republic
<Daniel.Peder@InfoSet.COM> http://www.infoset.com

Chase Whitener <cwhitener@gmail.com>

## BUGS

Please report any bugs or feature requests on GitHub [issues](https://github.com/genio/p5-mime-base32/issues).
Any and all criticism, bug reports, enhancements, fixes, etc. are appreciated.

## COPYRIGHT AND LICENSE INFORMATION

Copyright (c) 2003-2010 Daniel Peder.  All rights reserved.

This library is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

## SEE ALSO

[MIME::Base64](https://metacpan.org/pod/MIME::Base64), [RFC-3548, section 6](https://tools.ietf.org/html/rfc3548#section-6)
