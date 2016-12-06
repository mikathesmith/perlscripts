#!/usr/bin/perl
use warnings;
use strict;
use 5.010;

my $emily_wins=0;
my $thomas_wins =0;

foreach(1..1500){
    my $emily = choose_rand();
    my $prize = choose_rand();
    my $monty = make_choice($emily, $prize);
    my $thomas = make_choice($emily, $monty);

    say "Emily: $emily Thomas: $thomas Reveal: $monty Prize: $prize";

    if($emily==$prize){
        $emily_wins++;
    }elsif($thomas==$prize){
        $thomas_wins++;
    }
}

sub choose_rand{
    return int (rand(3));
}

sub make_choice{
my($a, $b) = @_;
    my $choice= choose_rand();
    while($choice == $a or $choice == $b){
        $choice= choose_rand();
    }
    return $choice;
}



sub monty_choice{
    my($emily, $prize) = @_;
    my $choice= int(rand(3));
    while($choice == $emily or $choice == $prize){
        $choice = int(rand(3));
    }
    return $choice; 
}

sub thomas_choice{
    my($emily, $monty) = @_;
    my $choice= int(rand(3));
    while($choice == $emily or $choice == $monty){
        $choice= int(rand(3));
    }
    return $choice; 
}








