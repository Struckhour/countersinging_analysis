
setwd('../desktop/Location_Data/final_analysis')
getwd()

library(song)

options(max.print=999999)

birds <- song.FromDataObj(wrens) # use song.FromTextFile() for text files
birds


test <- song.FromTextFile("song_frye31_with_frye32_05-06-2024.txt")            
#reads raw data from text file 

Time <- song.Simulate(test, num.rand = 1000, overlap.function = "song.TimeOverlap", randomize.function = "song.RandomizeSampleGaps") 
#Does the actual analysis with simulated sequences as described by Masco et al. (2016) 

song.Summarize(Time) 
#shows the results, which can be copied to your Excel file 

Num <- song.Simulate(test, num.rand = 1000, overlap.function = "song.NumOverlap", randomize.function = "song.RandomizeSampleGaps") 
song.Summarize(Num) 

#The above two lines do the same sequence again but with regard to Number of songs that overlap.