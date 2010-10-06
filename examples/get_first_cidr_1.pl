use strict;
use warnings;
use lib qw(../lib);
use IP::RangeCompare;
my $obj=IP::RangeCompare->parse_new_range( '10.0.0.0 - 10.0.0.4');
my ($first,$cidr_note,$next)=$obj->get_first_cidr;
print $first,"\n";
print $cidr_note,"\n";
print $next,"\n";
