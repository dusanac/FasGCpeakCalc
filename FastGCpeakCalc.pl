#!/usr/bin/perl

#This script is used for fastGC peak extraction 
#The program should be executed from the folder where the chromatograms are saved
#Please add the peak integration points in $t*s/e variables

#Global variables
my @file_names;

my $t1s, $t1e;
my $t2s, $t2e;
my $t3s, $t3e;
my $t4s, $t4e;
my $t5s, $t5e;
my $t6s, $t6e;
my $t7s, $t7e;

#define the peak window
$t1s = 43.3505;
$t1e = 46.3085;

$t2s = 46.4105;
$t2e = 49.0625;

$t3s = 50.6945;
$t3e = 54.5706;

$t4s = 55.3866;
$t4e = 59.8746;

$t5s = 60.1806;
$t5e = 64.2607;

$t6s = 64.4647;
$t6e = 68.1367;

$t7s = 0;
$t7e = 0;

#load the .txt files from the same directory
my @file_names = glob("*.txt");
 foreach my $file (@file_names) {
        print "$file\n";
}

open OUT, '>' ,"Report.csv" or die $!;
print OUT ("\nFile name,Peak1-m81,Peak1-m137, Peak2-m81,Peak2-m137, Peak3-m81,Peak3-m137, Peak4-m81,Peak4-m137, Peak5-m81,Peak5-m137, Peak6-m81,Peak6-m137\n");
#print("\nFile name,Peak1-m81,Peak1-m137\n");

foreach $fname (@file_names){

	#Loop through each mass in a file
	open SPECTRA, '<' ,"$fname" or die $!;
		my @spectra = <SPECTRA>; # each line of spetra is assighn in an array
	close SPECTRA;
		
	my $Ta1 = $Tb1 = $Ta2 = $Tb2 = $Ta3 = $Tb3 = $Ta4 = $Tb4 = $Ta5 = $Tb5 = $Ta6 = $Tb6 = $Ta7 = $Tb7 = 0;
	
	my $counter = 0;
	foreach $line (@spectra){
			$counter++;
			chomp ($line);
			#print "$line\n";
			($time , $cps1, $cps2) = split (/;|,|\t/, $line);
			
			#print "$counter\n";
			#print @temp[55];
			#print "$time\n";
			#print "$cps1\n";
			
			if ($counter == 1){				
				next;
				}#the first line
			
			if ($time >= $t1s && $time <= $t1e){
				$Ta1 += ($cps1);
				$Tb1 += ($cps2);
				#print "$time\n";
				next;
			}
			if ($time >= $t2s && $time <= $t2e){
				$Ta2 += ($cps1);
				$Tb2 += ($cps2);
				
				next;

			}
			if ($time >= $t3s && $time <= $t3e){
				$Ta3 += ($cps1);
				$Tb3 += ($cps2);
				
				next;

			}
			if ($time >= $t4s && $time <= $t4e){
				$Ta4 += ($cps1);
				$Tb4 += ($cps2);
				
				next;

			}
			if ($time >= $t5s && $time <= $t5e){
				$Ta5 += ($cps1);
				$Tb5 += ($cps2);
				
				next;

			}
			if ($time >= $t6s && $time <= $t6e){
				$Ta6 += ($cps1);
				$Tb6 += ($cps2);
				
				next;

			}
			if ($time >= $t7s && $time <= $t7e){
				$Ta7 += ($cps1);
				$Tb7 += ($cps2);
			
				next;

			}
			
			#print "@temp[0]";		
			
	}
	print OUT ("$fname, $Ta1, $Tb1, $Ta2, $Tb2, $Ta3, $Tb3, $Ta4, $Tb4, $Ta5, $Tb5, $Ta6, $Tb6\n");
}

close OUT;
