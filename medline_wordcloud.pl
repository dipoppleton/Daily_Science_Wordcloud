#/usr/bin/perl   
use File::Slurp;
no warnings 'experimental::smartmatch';

# The archive of Medline
my $website=' wget -q -O - ftp://ftp.ncbi.nlm.nih.gov/pubmed/updatefiles/';
my $results = `$website`;
my @lines =split(/\n/,$results);
my $goodone=$lines[-4];
my @dates=split(/\s+/,$lines[-4]);
my $day = $dates[3];
my $month = $dates[2];
my $year = $dates[1];
#Find todays files
my @files;
foreach my $line (@lines){
	my @fields =split(/\s+/,$line);
	if($day eq $fields[3]&& $month eq $fields[2] && $year eq $fields[1]){
		push (@files, $line);
	}
}

my @compilation;

foreach my $file (@files){
	$file=~ /href="(.*gz)">/;
	$path =$1;
# 	`rm *.gz*`;
	if ($path =~ /gz$/){
		$newwebsite="wget ".$path;
		`$newwebsite`;
		`gunzip *.gz`;
		`rm *.gz*`;
		$path=~/updatefiles\/(.*)\.gz/;
		$localpath=$1;
		my @templook = read_file($localpath);	
		foreach my $line (@templook){
			if ($line =~ /<ArticleTitle>(.*)<\/ArticleTitle>/){
				push (@compilation, $1."\n");	
		
			}
	
		}
	
	}
}
	`rm *.xml`;

my $outfile = 'Todayswords.txt';
open OF, "> $outfile" or die "WTF!! Can't open $f : $!";

foreach my $line (@compilation){
	print OF $line;
}
close OF;
EOF
