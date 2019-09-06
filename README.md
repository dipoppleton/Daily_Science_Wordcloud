# Daily_Science_Wordcloud
A combination of scripts that generate a scientific wordcloud from todays medlines submissions

This was designed for Mac, but it will probably work on Linux with minor modifications. Windows will take a bit more cajouling.

Dependencies:
Perl modules: slurm
Python: word cloud https://github.com/amueller/word_cloud

To get it running just clone MEDLINE_CONTROL.sh, common.txt, and medline_wordcloud.pl to a directory.
run MEDLINE_CONTROL.sh to get todays graphic or to have it run everyday, I recomend using crontab. 
