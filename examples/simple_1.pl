use strict;
use warnings;
use lib qw(../lib);
use IP::RangeCompare;

  my $obj=IP::RangeCompare::Simple->new;

  $obj->add_range('Tom','10.0.0.2 - 10.0.0.11');
  $obj->add_range('Tom','10.0.0.32 - 10.0.0.66');
  $obj->add_range('Tom','11/32');

  $obj->add_range('Sally','10.0.0.7 - 10.0.0.12');
  $obj->add_range('Sally','172.16/255.255.255');

  $obj->add_range('Harry','192.168.2');
  $obj->add_range('Harry','10.0.0.128/30');

 $obj->compare_ranges; # optional

        while(my ($common,%row)=$obj->get_row) {
                print "\nCommon Range: ",$common,"\n";
                my $tom=$row{Tom};
                my $sally=$row{Sally};
                my $harry=$row{Harry};
                print "Tom: ",$tom
                        ,' '
                        ,($tom->missing ? 'not used' : 'in use')
                        ,"\n";

                print "Sally: ",$sally
                        ,' '
                        , ($sally->missing ? 'not used' : 'in use')
                        ,"\n";

                print "Harry: ",$harry,
                        ' '
                        ,($harry->missing ? 'not used' : 'in use')
                        ,"\n";
        }


