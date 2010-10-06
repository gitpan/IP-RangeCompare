use strict;
use warnings;
use lib qw(../lib);
use IP::RangeCompare qw(:PROCESS);

  my $ranges=[
    [
      map { IP::RangeCompare->parse_new_range(@{$_}[0,1]) }
        [qw(10.0.0 10.0.0.1)]
        ,[qw(10.0.0.2 10.0.0.5)]
    ]

    ,[
      map { IP::RangeCompare->parse_new_range(@{$_}[0,1]) }
        [qw(10.0.0.0 10.0.0.1)]
        ,[qw(10.0.0.3 10.0.0.4)]
        ,[qw(10.0.0.4 10.0.0.5)]
    ]

    ,[
      map { IP::RangeCompare->parse_new_range(@{$_}[0,1]) }
        [qw(10.0.0.0 10.0.0.1)]
        ,[qw(10.0.0.3 10.0.0.3)]
        ,[qw(10.0.0.4 10.0.0.5)]
    ]
  ];
  my $data=[];
  # consolidate ranges -- prevents odd results
  while(my $list=shift @$ranges) {
    push @$data,consolidate_ranges($list);
  }
  my ($row,$cols,$next);
  while(1) {
    ($row,$cols,$next)=compare_row($data,$row,$cols);
    print join(', ',@$row),"\n";
    last unless $next;
  }

