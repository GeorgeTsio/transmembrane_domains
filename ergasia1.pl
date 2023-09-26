open OUT,">out.txt";

$/="\/\/\n";

while (<>)
{
	if($_=~/^ID\s{3}(.*?)\s+(.*?)\;\s+(\d+\sAA.)/m) #kratame to ID ths proteinis mas
	{
		print OUT ">$1";
	}
	
	if($_=~/^AC\s{3}(.*?)\;/m) #kratame to AC ths proteinis mas
	{
		print OUT "|$1";
	}

	if($_=~/^SQ   SEQUENCE\s+(.*?)\;/m) #edw stin ousia exoume kai to megethos tis akoloythias
	{
		print OUT "|$1\n";
		
		if ($1=~/^(\d+)\sAA/) #gia na kratisoume mono ton arithmo kai oxi gia paradeigma to 365 AA
		{
		   $numOfAA = $1;
		}
		
	}
	
	for ($i=0 ; $i<$numOfAA ; $i++) #dimiourgoume enan pinaka me - oso to megethos tis akolouthias
	{
		@TransmemArr[$i] = "-";
	}

	
    while($_=~/^FT\s{3}TRANSMEM\s+(\d+)\s+(\d+)\s+(.*)\./mg) #kanoume while gia na diabasei OLA ta diamembranika
	{

	$tmstart=$1; #antisoixei sthn prwti paren8esh
	$tmend=$2; #antisoixei sthn deuteri paren8esh
	
	
		 for ($j=$tmstart ; $j<=$tmend ; $j++) #eisagoume ta M sta simeia apo tmstart mexri tmend,diladi ekei pou kseroume oti iparxoun
		 {									   #diamembranika tmimata
				@TransmemArr[$j] = "M";
		 }
   }
   
	while($_=~/^\s{5}(.*)/mg) #ektipwnoume tin akolouthia
	{
		$sequence=$1;
		$sequence=~s/\s//g;
		
		print OUT "$sequence";
	}
	
print OUT "\n"; #gia na ginei ennalagi grammis oste na bgei panw i allilouxia kai katw i diamembranikotita

	for ($k=0 ; $k<$numOfAA ; $k++) #ektipwnoume ton pinaka mas pou pleon gnwrizoume ta diamembranika tmimata
	{
		 print OUT @TransmemArr[$k];	 
	}

print OUT "\n\/\/\n";
}

close OUT

