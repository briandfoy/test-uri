# $Id$
use ExtUtils::MakeMaker;

#use Test::Manifest qw(get_t_files);

WriteMakefile
        (
        'NAME'      => 'Test::URI',
        'ABSTRACT'  => 'Check Uniform Resource Identifiers',
        'VERSION'   => '0.5_01',
 		'PREREQ_PM' => {
 			'Test::Pod'             => 0,
 			'Test::Manifest'        => 0,
 			'Test::More'            => 0,
 			'Test::Builder::Tester' => 0,
 			'URI'                   => 0,
 			},
        'PM'        => 
        	{
            'lib/URI.pm'     => '$(INST_LIBDIR)/URI.pm',
          },
 
 		#depend => { Makefile => 't/test_manifest' },
        test   => { TESTS => 't/load.t t/pod.t t/functions.t' },
        );

