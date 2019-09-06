#/usr/bin/perl   
use File::Slurp;
# use Image::WordCloud;
no warnings 'experimental::smartmatch';

# print "\nThis
# ';
# print "usage perl ID_update.pl Infile Outfile \n";
# 
# 
# $file_out_ids = $ARGV[0];
# $file_out_ = $ARGV[1];

my $website=' wget -q -O - ftp://ftp.ncbi.nlm.nih.gov/pubmed/updatefiles/';
my $results = `$website`;
# print $results;
my @lines =split(/\n/,$results);
my $goodone=$lines[-4];
# print $goodone;
my @dates=split(/\s+/,$lines[-4]);
# print $dates[5]."\t".$dates[1]."\t".$dates[2]."\t".$dates[3]."\t";
my $day = $dates[3];
my $month = $dates[2];
my $year = $dates[1];

my @files;
foreach my $line (@lines){
	my @fields =split(/\s+/,$line);
	if($day eq $fields[3]&& $month eq $fields[2] && $year eq $fields[1]){
		push (@files, $line);
	}
}

my @compilation;

#         <ArticleTitle>Study on calcium oxalate monohydrate renal uroliths. III. Composition and density.</ArticleTitle>


foreach my $file (@files){
	$file=~ /href="(.*gz)">/;
	$path =$1;
# 	`rm *.gz*`;
	if ($path =~ /gz$/){
	$newwebsite="wget ".$path;
# 		print "\n\n".$path."\n";

	`$newwebsite`;
	`gunzip *.gz`;
	`rm *.gz*`;
	$path=~/updatefiles\/(.*)\.gz/;
	$localpath=$1;
	print $localpath;
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

# my @idlist = read_file($ARGV[0]);	
# 
# 
# $efetch1='esearch -db pubmed -query "';
# $efetch2='" -datetype PDAT -days 7 | efetch;
# ';
# $efetch3='" |esummary;
# ';
# 
# # THIS IS TERRIBLE!!!
# # @idlist;
# 	
# # my $alphabet = 'a';
# # until ($alphabet eq 'z'){
# # 	my $efetch =$efetch1.$alphabet.$efetch2;	
# # 	my $results= `$efetch`;	
# # 	push @idlist, split("\n",$results)
# # 	$alphabet++;
# # }
# # cat 
# chomp @idlist;
# my @uniqueids = uniq(@idlist);
# print "\n";
# 
# 
# my %words;
# foreach my $ID (@uniqueids){
# 	chomp $ID;
# 	my $efetch =$efetch1.$ID.$efetch3;
# 	my $results= `$efetch`;	
# # 		print $results;
# 
# 	$results =~ /<Title>(.*)<\/Title>/;
# 	my $title= $1;
# 	print $title."\n";
# 	$title = uc $title;
# 	@sentence=split(/[^A-Z]/,$title);
# 	foreach my $i (@sentence){
# 		$words{$i}=$words{$i}+1;
# 	}	
# 	
# }
# # foreach $key (keys %words){
# #   $value = $words{$key};
# #   print "  $key costs $value\n";
# # }
# 
# 
# my $wc = Image::WordCloud->new(image_size => [2000, 2000]);
# $wc->words(%words);
# my $gd = $wc->cloud();
# open(my $fh, '>', 'gettysburg.png');
#         binmode $fh;
#         print $fh $gd->png();
# close($fh);
# 
# 
# sub uniq {
#     my %seen;
#     grep !$seen{$_}++, @_;
# }


	
