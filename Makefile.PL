# $Id$
use ExtUtils::MakeMaker;

my $tests = do {
	local @ARGV = qw(t/test_manifest);
	my $data = join " ", map {chomp; "t/$_" } <>;
	};

WriteMakefile
        (
        'NAME'      => 'Test::URI',
        'ABSTRACT'  => 'Check Uniform Resource Identifiers',
        'VERSION'   => '0.5_04',
 		'PREREQ_PM' => {
 			'File::Find::Rule'      => 0,
 			'Test::Pod'             => 0,
 			'Test::More'            => 0,
 			'Test::Builder::Tester' => 0,
 			'URI'                   => 0,
 			},
        'PM'        => 
        	{
            'lib/URI.pm'     => '$(INST_LIBDIR)/URI.pm',
          },
 
 		depend => { Makefile => 't/test_manifest' },
        test   => { TESTS => $tests },
        );

