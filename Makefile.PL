use 5.008001;
use strict;
use warnings;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.

WriteMakefile(
	NAME => 'MIME::Base32',
	AUTHOR => q{Daniel Peder <DanPeder@CPAN.ORG>},
	VERSION_FROM => 'lib/MIME/Base32.pm',
	ABSTRACT_FROM => 'lib/MIME/Base32.pm',
	LICENSE => 'perl',
	MIN_PERL_VERSION => 5.008001,
	BUILD_REQUIRES => {
		'FindBin' => 0,
		'Test::More' => 0.88,
		'Test::Pod' => 0,
		'Test::Pod::Coverage' => 0,
	},
	PREREQ_PM => {
		'Exporter' => 0.0,
		'IO::All' => 0.0,
		'strictures' => 2.0,
		'utf8' => 0,
	},
	META_MERGE => {
		requires  => {perl => '5.008001'},
		resources => {
			license	=> 'perl',
			homepage => 'https://github.com/genio/p5-mime-base32',
			repository => {
				type => 'git',
				url => 'git://github.com/genio/p5-mime-base32.git',
				web => 'https://github.com/genio/p5-mime-base32',
			},
			bugtracker => {
				web => 'https://github.com/genio/p5-mime-base32/issues',
			},
		},
		no_index => {directory => ['t']}
	},
);
