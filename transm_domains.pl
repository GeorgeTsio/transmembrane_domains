open OUT,">out.txt";

$/="\/\/\n";

while (<>)
{
	if($_=~/^ID\s{3}(.*?)\s+(.*?)\;\s+(\d+\sAA.)/m) #keeps the ID of our protein
	{
		print OUT ">$1";
	}
	
	if($_=~/^AC\s{3}(.*?)\;/m) #keeps the AC of the protein
	{
		print OUT "|$1";
	}

	if($_=~/^SQ   SEQUENCE\s+(.*?)\;/m) #keeps the length of the sequence
	{
		print OUT "|$1\n";
		
		if ($1=~/^(\d+)\sAA/) #to keep only the number end not the "AA"
		{
		   $numOfAA = $1;
		}
		
	}
	
	for ($i=0 ; $i<$numOfAA ; $i++) #creates a table with "-" as long as the length of the sequence
	{
		@TransmemArr[$i] = "-";
	}

	
    while($_=~/^FT\s{3}TRANSMEM\s+(\d+)\s+(\d+)\s+(.*)\./mg)
	{

	$tmstart=$1; #corresponds to the first parenthesis
	$tmend=$2; #corresponds to the second parenthesis
	
	
		 for ($j=$tmstart ; $j<=$tmend ; $j++) #inserts M from tmstart until tmend, which corresponds to transmembrane part 
		 {									   
				@TransmemArr[$j] = "M";
		 }
   }
   
	while($_=~/^\s{5}(.*)/mg) #display the sequence
	{
		$sequence=$1;
		$sequence=~s/\s//g;
		
		print OUT "$sequence";
	}
	
print OUT "\n"; #to change the line in order to print in different line the sequence and the transmembrane domains

	for ($k=0 ; $k<$numOfAA ; $k++) #display the array with the ton pinaka mas pou pleon gnwrizoume ta diamembranika tmimata
	{
		 print OUT @TransmemArr[$k];	 
	}

print OUT "\n\/\/\n";
}

close OUT

