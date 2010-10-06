use strict;
use warnings;
use lib qw(../lib);
use IP::RangeCompare;
  my $obj=IP::RangeCompare->parse_new_range('10/30');
  my $sub=$obj->enumerate(31);
  while(my $range=$sub->()) {
    print $range,"\n"
  }

