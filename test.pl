# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..1\n"; }
END {print "not ok 1\n" unless $loaded;}
use Silly::Krad;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

my $Krad=Silly::Krad::new();
my ($Failmsg,$Encode,$Decode);

if ($Krad)
{
	print "ok 2\n";
}
else
{
	print "not ok 2\n";
	$Failmsg="Error calling \"new\", sorry\n";
}

if (!$Failmsg)
{
	$Encode=$Krad->encode("Q");

	if ($Encode == 9)
	{
		print "ok 3\n";
	}
	else
	{
		print "not ok 3\n";
		$Failmsg="Error calling \"encode\", sorry\n";
	}
}

if (!$Failmsg)
{
	$Decode=$Krad->decode($Encode);

	if ($Decode =~ /Q/)
	{
		print "ok 4\n";
	}
	else
	{
		print "not ok 4\n";
		$Failmsg="Error calling \"decode\", sorry\n";
	}
}

if (!$Failmsg)
{
	print "All tests successful\n";
	exit(0);
}
else
{
	print "$Failmsg\n";
	exit(1);
}
