# $Id$
package Test::URI;
use strict;

use base qw(Exporter);
use vars qw(@EXPORT);

use URI;
use Exporter;
use Test::Builder;

my $Test = Test::Builder->new();

@EXPORT = qw(uri_scheme_ok uri_host_ok uri_port_ok);

=head1 NAME

Test::URI - Check Uniform Resource Identifiers

=head1 SYNOPSIS

	use Test::More tests => 1;
	use Test::URI;
	
	uri_scheme_ok( $uri, 'gopher' );
	
=head1 DESCRIPTION

Check various parts of Uniform Resource Locators

=head1 FUNCTIONS

=over 4

=item uri_scheme_ok( STRING|URI, SCHEME )

Ok is the STRING is a valid URI, in any format that
URI accepts, and the URI uses the same SCHEME (i.e.
protocol: http, ftp, ...). SCHEME is not case
sensitive.

STRING can be an URI object.

=cut

sub uri_scheme_ok($$)
	{	
	my $string = shift;
	my $scheme = lc shift;
	
	my $uri    = ref $string ? $string : URI->new( $string );
	
	unless( UNIVERSAL::isa( $uri, 'URI' ) )
		{
		$Test->ok(0);
		$Test->diag("URI [$string] does not appear to be valid");
		}
	elsif( $uri->scheme ne $scheme )
		{
		$Test->ok(0);
		$Test->diag("URI [$string] does not have the right scheme\n",
			"\tExpected [$scheme]\n",
			"\tGot [" . $uri->scheme . "]\n",
			);
		}
	else
		{
		$Test->ok(1);
		}
		
	}
	
=item uri_host_ok( STRING|URI, HOST )

Ok is the STRING is a valid URI, in any format that
URI accepts, and the URI uses the same HOST.  HOST
is not case sensitive.

STRING can be an URI object.

=cut

sub uri_host_ok($$)
	{	
	my $string = shift;
	my $host   = lc shift;
	
	my $uri    = ref $string ? $string : URI->new( $string );
	
	unless( UNIVERSAL::isa( $uri, 'URI' ) )
		{
		$Test->ok(0);
		$Test->diag("URI [$string] does not appear to be valid");
		}
	elsif( not $uri->can('host') )
		{
		$Test->ok(0);
		my $scheme = $uri->scheme;
		$Test->diag("$scheme schemes do not have a host");
		}		
	elsif( $uri->host ne $host )
		{
		$Test->ok(0);
		$Test->diag("URI [$string] does not have the right host\n",
			"\tExpected [$host]\n",
			"\tGot [" . $uri->host . "]\n",
			);
		}
	else
		{
		$Test->ok(1);
		}
		
	}

=item uri_port_ok( STRING|URI, PORT )

Ok is the STRING is a valid URI, in any format that
URI accepts, and the URI uses the same PORT.

STRING can be an URI object.

=cut

my %Portless = map { $_, $_ } qw(mailto file);

sub uri_port_ok($$)
	{	
	my $string = shift;
	my $port   = lc shift;
	
	my $uri    = ref $string ? $string : URI->new( $string );
	
	unless( UNIVERSAL::isa( $uri, 'URI' ) )
		{
		$Test->ok(0);
		$Test->diag("URI [$string] does not appear to be valid");
		}
	elsif( not $uri->can('port') )
		{
		$Test->ok(0);
		my $scheme = $uri->scheme;
		$Test->diag("$scheme schemes do not have a port");
		}		
	elsif( $uri->port ne $port )
		{
		$Test->ok(0);
		$Test->diag("URI [$string] does not have the right port\n",
			"\tExpected [$port]\n",
			"\tGot [" . $uri->port . "]\n",
			);
		}
	else
		{
		$Test->ok(1);
		}
		
	}
	
=back

=head1 AUTHOR

brian d foy, E<lt>brian d foyE<gt>

=head1 COPYRIGHT

Copyright 2002 brian d foy, All rights reserved.

You can use this module under the same terms as
Perl itself.

=cut

1;
