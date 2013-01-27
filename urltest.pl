#!/usr/bin/env perl
use warnings;
use LWP::UserAgent;

### load parser ###

### fetch package status ###

my $browser= new LWP::UserAgent (
	cookie_jar => {},
		timeout => '15',
		);

		$browser->agent('Mozilla/5.0');

		my %logindata = (
			username => '**',
				password => "**",
				);

				#login page

				open my $urllist, '<', "urls.txt";
				@urls=<$urllist>;
				close $urllist;

				my $loginurl="https://gbadmin.hostgator.com/login/";
				my $gbill = $browser->post($loginurl, Content=> \%logindata);

				foreach my $accturl (@urls) {
				my $pdata = $browser->get("$accturl");
				my @pdataload= $pdata->decoded_content;
				## parse ##
				my $time=time;
 				open my $parseout, '>', "./tmp/acct-$time.html";
				print $parseout @pdataload;
				close $parseout;
				my @accthtml= qx(lynx --dump --width 900 ./tmp/acct-$time.html);
				foreach (@accthtml) {
					print $_ if ($_ =~ m/Cancelled/i);
					};
					};
					;

