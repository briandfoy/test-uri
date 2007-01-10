# $Id$
use ExtUtils::MakeMaker;

eval "use Test::Manifest 1.14";

WriteMakefile
	(
	'NAME'           => 'Test::URI',
	'ABSTRACT'       => 'Check Uniform Resource Identifiers',
	'VERSION_FROM'   => 'lib/URI.pm',
	'LICENSE'        => 'perl',

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

