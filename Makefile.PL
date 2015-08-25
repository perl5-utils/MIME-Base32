use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'		=> 'MIME::Base32',
    'VERSION_FROM'	=> 'Base32.pm', # finds $VERSION
    'PREREQ_PM'		=> {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ? (
      ABSTRACT_FROM => 'Base32.pm', 
      AUTHOR     => 'Daniel Peder <DanPeder@CPAN.ORG>',
    ) : ()),
);
sub MY::postamble { q{

docs : README

README: Base32.pm
	pod2text --loose Base32.pm > README

xdist:
	[ -f MANIFEST ] && rm -f MANIFEST ; make realclean docs manifest tardist; perl Makefile.PL

}; }
