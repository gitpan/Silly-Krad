package Silly::Krad;

require 5.005_62;
use strict;
use warnings;
use Carp;

require Exporter;
our $VERSION = '0.03';

sub new
{
        my $Proto=shift;
        my $Class=ref($Proto) || $Proto;
        my $Self={};
	bless $Self;
	return $Self;
}

sub encode
{
	my $Self=shift;
	my $Text=shift;
	my $Return;	
	my %Eng_to_Krad=("a" => "4",
			"A" => "a",
			"b" => "b",
			"B" => "8",
			"c" => "c",
			"C" => "C",
			"d" => "d",
			"D" => "D",
			"e" => "3",
			"E" => "e",
			"f" => "f",
			"F" => "F",
			"g" => "g",
			"G" => "G",
			"h" => "h",
			"H" => "H",
			"i" => "!",
			"I" => "I",
			"j" => ";",
			"J" => "J",
			"k" => "k",
			"K" => "K",
			"l" => "1",
			"L" => "L",
			"m" => "m",
			"M" => "M",
			"n" => "n",
			"N" => "N",
			"o" => "0",
			"O" => "O",
			"p" => "p",
			"P" => "P",
			"q" => "q",
			"Q" => "9",
			"r" => "r",
			"R" => "R",
			"s" => '$',
			"S" => "5",
			"t" => "t",
			"T" => "T",
			"u" => "u",
			"U" => "U",
			"v" => "v",
			"V" => "V",
			"w" => "w",
			"W" => "W",
			"x" => "x",
			"X" => "X",
			"y" => "y",
			"Y" => "Y",
			"z" => "2",
			"Z" => "z",
			"0" => "o",
			"1" => "l",
			"2" => "Z",
			"3" => "E",
			"4" => "A",
			"5" => "S",
			"6" => "6",
			"7" => "7",
			"8" => "B",
			"9" => "Q",
			'$' => "s",
			';' => "j",
			'!' => "i");

	my @Splitter=split(//,$Text);
	foreach my $Char (@Splitter)
	{
		if ($Eng_to_Krad{$Char})
		{
			$Return.="$Eng_to_Krad{$Char}";
		}
		else
		{
			$Return.="$Char";
		}
	}

	return $Return;
}

sub decode
{
	my $Self=shift;
	my $Text=shift;
	my $Return;
	my %Krad_to_Eng=("4" => "a",
			"a" => "A",
			"b" => "b",
			"8" => "B",
			"c" => "c",
			"C" => "C",
			"d" => "d",
			"D" => "D",
			"3" => "e",
			"e" => "E",
			"f" => "f",
			"F" => "F",
			"g" => "g",
			"G" => "G",
			"h" => "h",
			"H" => "H",
			'!' => "i",
			"I" => "I",
			';' => "j",
			"J" => "J",
			"k" => "k",
			"K" => "K",
			"1" => "l",
			"L" => "L",
			"m" => "m",
			"M" => "M",
			"n" => "n",
			"N" => "N",
			"0" => "o",
			"O" => "O",
			"p" => "p",
			"P" => "P",
			"q" => "q",
			"9" => "Q",
			"r" => "r",
			"R" => "R",
			'$' => "s",
			"5" => "S",
			"t" => "t",
			"T" => "T",
			"u" => "u",
			"U" => "U",
			"v" => "v",
			"V" => "V",
			"w" => "w",
			"W" => "W",
			"x" => "x",
			"X" => "X",
			"y" => "y",
			"Y" => "Y",
			"2" => "z",
			"z" => "Z",
			"o" => "0",
			"l" => "1",
			"Z" => "2",
			"E" => "3",
			"A" => "4",
			"S" => "5",
			"6" => "6",
			"7" => "7",
			"B" => "8",
			"Q" => "9",
			"s" => '$',
			"j" => ';',
			"i" => '!');

	my @Splitter=split(//,$Text);
	foreach my $Char (@Splitter)
	{
		if ($Krad_to_Eng{$Char})
		{
			$Return.="$Krad_to_Eng{$Char}";
		}
		else
		{
			$Return.="$Char";
		}
	}

	return $Return;
}

1;
__END__

=head1 NAME

Silly::K-Rad - Make text hard to read...

=head1 SYNOPSIS

  use Silly::KRad;

  # Create a new KRad encoder/decoder

  my $KRad=Silly::KRad::new();

  # Encode some text to KRad

  my $Text="Convert me to KRad\n";
  my $Encoded=$KRad->encode($Text);

  # Decode KRad text

  my $Decoded=$KRad->decode($Encoded);

=head1 DESCRIPTION

Silly::KRad is useful for encoding text documents to make them harder to read.
Impress your friends, 31337 hax0rs and others.

Silly::KRad switches letters and numbers with other characters that look
similar.  For example, "hello world" becomes "h311o wor1d".

=head1 AUTHOR

Marc Slagle - marc.slagle@securelevel.com

=cut
