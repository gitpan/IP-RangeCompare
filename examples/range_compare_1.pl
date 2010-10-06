use strict;
use warnings;
use lib qw(../lib);
use IP::RangeCompare qw(:PROCESS);

  my $list_a=[];
  my $list_b=[];
  my $list_c=[];

  push @$list_a, IP::RangeCompare->parse_new_range( '10.0.0.0 - 10.0.0.1');
  push @$list_a, IP::RangeCompare->parse_new_range( '10.0.0.2 - 10.0.0.5');
  push @$list_b, IP::RangeCompare->parse_new_range( '10.0.0.0 - 10.0.0.1');
  push @$list_b, IP::RangeCompare->parse_new_range( '10.0.0.3 - 10.0.0.4');
  push @$list_b, IP::RangeCompare->parse_new_range( '10.0.0.4 - 10.0.0.5');
  push @$list_c, IP::RangeCompare->parse_new_range( '10.0.0.0 - 10.0.0.1');
  push @$list_c, IP::RangeCompare->parse_new_range( '10.0.0.3 - 10.0.0.3');
  push @$list_c, IP::RangeCompare->parse_new_range( '10.0.0.4 - 10.0.0.5');
  my $sub=range_compare([  $list_a,$list_b,$list_c] );

  while(my ($common,$range_a,$range_b,$range_c)=$sub->()) {
    print "\nCommon Range: ",$common,"\n";
    print 'a: ',$range_a
      ,' '
      ,($range_a->missing ? 'not used' : 'in use')
      ,"\n";
    print 'b: ',$range_b
      ,' '
      ,($range_b->missing ? 'not used' : 'in use')
      ,"\n";
    print 'c: ',$range_c
      ,' '
      ,($range_c->missing ? 'not used' : 'in use')
      ,"\n";
  }



