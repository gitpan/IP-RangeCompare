use strict;
use warnings;
use lib qw(../lib);
use IP::RangeCompare qw(:PROCESS);
  my $list=[];
  push @$list,IP::RangeCompare->parse_new_range('10/32');
  push @$list,IP::RangeCompare->parse_new_range('10/32');
  push @$list,IP::RangeCompare->parse_new_range('10/30');
  push @$list,IP::RangeCompare->parse_new_range('10/24');
  push @$list,IP::RangeCompare->parse_new_range('8/24');

  $list=consolidate_ranges($list);

  while(my $range=shift @$list) {
    print $range,"\n";
  }

