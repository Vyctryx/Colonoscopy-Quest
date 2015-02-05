#!/usr/bin/env perl
 
use 5.010000;
use warnings;
use strict;
use POSIX;
use Method::Signatures;

my $gold;
my $room_gold;
my $time;

$gold = 0;
$time = 0;

 func help() {
	my $desc = "Possible commands: look, look [item], take [item], n, s, e, w, quit.
Examples: 'look picoprep', 'take broth'.";

	say $desc;

	return;
}

func sing_shanty() {

	my $choice = int(rand(6));

	my $shanty_one = "\"It’s of dear grog to you I’ll sing,
\"And to dear grog I’ll always cling,
\"I like my cup filled to the brim,
\"And I’ll drink all you’d like to bring!!!\"

... But then you remember that you can't have grog right now, or *anything* else.
You feel sad.";

	my $shanty_two = "\"Chicken on a raft on a Monday morning
\"Oh, what a terrible sight to see,
\"’Dabtoe’s forward and the dustman’s aft,
\"Sittin’ there pickin’ at a chicken on a raft.
\"Hi ho, chicken on a raft!
\"Hi ho, chicken on a raft!\"

Cluckington cheers!";

	my $shanty_three = "\"Oh the ocean waves do roll,
\"And the stormy winds do blow,
\"Aye, and we poor sailors are skipping at the top.
\"And the landlubbers lie down below, below, below,
\"And the landlubbers lie down below!\"";

	my $shanty_four = "\"Shiver my timbers, shiver my sides,
\"Yo oh heave ho!
\"There are hungers as strong as the wind and tides,
\"Yo oh heave ho!\"";

	my $shanty_five = "\"Way hey and away we go
\"Donkey riding, donkey riding
\"Way hey and away we go
\"Ridin' on a donkey.\"";
	
	my $shanty_six = "\"Never gonna give you up,
\"Never gonna let you down,
\"Never gonna run around and desert you.
\"Never gonna make you cry,
\"Never gonna say goodbye,
\"Never gonna tell a lie and hurt you.\"

... Wait, what?";

	my @shanty = ($shanty_one, $shanty_two, $shanty_three, $shanty_four, $shanty_five, $shanty_six);


	print "You clear your throat and get ready to let loose some sweet tunes and moves:\n\n ";
	print "$shanty[$choice]\n";

	return;
	
}

func start() {
	my $desc = "!COLONOSCOPY QUEST!
You wake up to your fabulous nyan cat alarm going off, and find yourself in your bed. 
You have no idea how you got here!

You remember that today is the day of your very first colonoscopy. 
You'd better get up and deal with that. ";

	say $desc;

	bed_look();
}

func bed_look() {
		my $desc = "You are in bed. Your bedroom is decorated with pirate booty. It is awesome.
There is a door to the (W)est.
You have $gold gold.
Type 'help' for a full list of commands";

	say $desc;

	$room_gold = 5;

	bed();
}

=head
sub check_input {
	my ($room, $cmd) = @_;

	my $flag = 0;

	if ($cmd eq "look") {
		$room->();
	}
	elsif ($cmd eq "exit" || $cmd eq "quit" || $cmd eq "q"){
		exit();
	}
	elsif ($cmd eq "help") {
		help();
	}
	elsif ($cmd eq "w") {
		kitchen_look();
	}
	else {
		$flag = 1;
	}

	return $flag;
}
=cut



func bed() {
	my $cmd = <STDIN>;
	chomp($cmd);
	lc $cmd;

=head
	if (check_input( \&bed_look(), $cmd) ){
		if ($cmd eq "w") {
			kitchen_look();
		}
		else {
			say "What you say?";
			bed();
		}
	else {
		bed();
	}
=cut

	if ($cmd eq "look") {
		bed_look();
	}
	elsif ($cmd eq "exit" || $cmd eq "quit" || $cmd eq "q"){
		exit();
	}
	elsif ($cmd eq "help") {
		help();
		bed();
	}
	elsif ($cmd eq "w") {
		kitchen_look();
	}
	elsif ($cmd eq "look booty" || $cmd eq "look pirate booty") {
		if($room_gold != 0) {
			say "You look around at your pirate loot. You can see some gold! You should sing a shanty!";
		}
		else {
			say "Arrr, some fine pirate booty it be!";
		}
		bed();
	}
	elsif ($cmd eq "take gold") {
		if ($room_gold != 0){
			$gold += 5;
			$room_gold = 0;
			say "You take the gold. You now have $gold gold.";
		}
		else {
			say "There is no gold left to take.";
		}
		bed();
	}
	elsif ($cmd eq "shanty" || $cmd eq "sing shanty") {
		sing_shanty();
		bed();
	}
	else {
		say "What you say?";
		bed();
	}
}

func kitchen_look() {
	my $desc = "Kitchen things";

	say $desc;
	kitchen();
}

func kitchen(){

}

start();
