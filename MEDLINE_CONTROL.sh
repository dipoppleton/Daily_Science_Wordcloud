#!/bin/bash
# Get the resolution of the screen
RESOLUTION=$(system_profiler SPDisplaysDataType |grep Resolution);
# Get the X resolution
WIDTH=$(echo $RESOLUTION|awk '{print $2}')
# Get the Y resolution
# echo $RESOLUTION|awk '{print $4}'
HEIGHT=$(echo $RESOLUTION|awk '{print $4}')
# Get the data 
perl medline_wordcloud.pl;
# Draw the two images
wordcloud_cli --text Todayswords.txt --width $WIDTH --height $HEIGHT --stopwords common.txt --background "white" --imagefile whitetoday.png
wordcloud_cli --text Todayswords.txt --width $WIDTH --height $HEIGHT --imagefile --stopwords common.txt blacktoday.png