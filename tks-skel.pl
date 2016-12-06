#!/usr/bin/perl
use warnings;
use strict;
use 5.010;
use DateTime;
use autodie; 
use POSIX('strftime');

my ($year, $month, $dt, $filename);

if(@ARGV){
    ($year, $month) = @ARGV;
    $dt = DateTime->new(year=>$year, month=>$month, day=>1);
    $filename = "$year-$month.tks";
}else{
    $dt = DateTime->new(); 
    $filename = "default-time.tks";
}
#default to current month if no args


#my $dt = DateTime->new(year=>$year, month=>$month, day=>1);
#my $filename = "$year-$month.tks";
say"creating $filename";

open(my $fh, '>', $filename);

foreach(1..31){ 
    if($dt->day_name ne "Saturday" and $dt->day_name ne "Sunday"){
        print $fh $dt->ymd, " # ", $dt->day_name,"\n\n";
    }
    $dt->add(days=>1);
    last if $dt->month != $month;
}

close($fh); 
