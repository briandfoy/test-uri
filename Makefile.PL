# $Id$
use ExtUtils::MakeMaker;

eval "use Test::Manifest";

unless( $@ )
	{
	* ExtUtils::MM_Any::test_via_harness = sub
		{
		my($self, $perl, $tests) = @_;

		return qq|\t$perl "-MTest::Manifest" | .
		  qq|"-e" "run_t_manifest(\$(TEST_VERBOSE), '\$(INST_LIB)', | .
		  qq|'\$(INST_ARCHLIB)')"\n|;
		}
	}

WriteMakefile
        (
        'NAME'           => 'Test::URI',
        'ABSTRACT'       => 'Check Uniform Resource Identifiers',
        'VERSION_FROM'   => 'lib/URI.pm',

 		'PREREQ_PM' => {
 			'Test::More'            => '0',
 			'Test::Builder::Tester' => '0',
 			'URI'                   => '0',
 			},

        'PM'        => 
        	{
            'lib/URI.pm'     => '$(INST_LIBDIR)/URI.pm',
          },
 

		'MAN3PODS'     => {
			'lib/URI.pm' => '$(INST_MAN3DIR)/Test::URI.3',
			},

		clean  => { FILES    => q|Test-URI-* test_files| },
        );

