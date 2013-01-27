#!/usr/bin/env perl
usr warnings;
use LWP::UserAgent;

my $browser=new LWP::UserAgent (
  cookie_jar => {},
  timeout => '15',
	);

	$browser->agent('Mozilla/5.0');

	my %logindata = (

		username => ;'***********',
		password => "************",

	open my $urllist, '<', "urls.txt";
	@urls=<$urllist>;
	close $urllist;

	my $loginurl="https://gbadmin.hostgator.com/login/";
	my $gbill = $browser->post($loginurl, Content=> \%logindata);

	if (index($accturl,'search') > -1 {

	my $pdata = $browser->get("$accturl");
        my @pdataload= $pdata->decoded_content;

	my $time=time;
	open my $parseout, '>', "$home/tmp/acct-$time.html";
	print $parseout @pdataload;
	close $parseout;
	my @accthtml= qx(lynx --dump --width 900 $home/tmp/acct/-$time.html);
	foreach (@accthtml) {
		print $_ if ($_ =~ m/Cancelled/i);
		};
		};
