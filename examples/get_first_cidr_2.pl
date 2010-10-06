use strict;
use warnings;
use lib qw(../lib);
use IP::RangeCompare;
    my $obj=IP::RangeCompare->parse_new_range( '10.0.0.0 - 10.0.0.4');
    my ($first,$cidr,$next);
    $next=$obj;
    while($next) {
      ($first,$cidr,$next)=$next->get_first_cidr;
      print "Range Notation: ",$first,"\n";
      print "Cidr Notation : ",$cidr,"\n";
    }

