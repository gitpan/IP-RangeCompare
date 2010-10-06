use strict;
use warnings;
use lib qw(../lib);
use Data::Dumper;
use IP::RangeCompare qw(:PROCESS);

  my $list_a=[];
  my $list_b=[];

  push @$list_a,IP::RangeCompare->parse_new_range('10/24');
  push @$list_a,IP::RangeCompare->parse_new_range('10/25');
  push @$list_a,IP::RangeCompare->parse_new_range('11/24');

  push @$list_b,IP::RangeCompare->parse_new_range('7/24');
  push @$list_b,IP::RangeCompare->parse_new_range('8/24');

  #to prevent strange results always consolidate first
  $list_a=consolidate_ranges($list_a);
  $list_b=consolidate_ranges($list_b);


  my $list_of_lists=range_start_end_fill([$list_a,$list_b]);
  my @name=qw(a b);
  foreach my $list (@$list_of_lists) {
    my $name=shift @name;
    print '$list_',$name,"\n";
    foreach my $range (@$list) {
    	print $range,"\n";
    }
  }

