use 5.006002;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'IP::RangeCompare',
    VERSION_FROM      => 'lib/IP/RangeCompare.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/IP/RangeCompare.pm', # retrieve abstract from module
       AUTHOR         => 'Michael Shipper') : ()),
);
