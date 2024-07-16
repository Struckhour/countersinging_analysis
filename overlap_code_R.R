
setwd('../desktop/Location_Data/final_analysis')
getwd()

library(song)

options(max.print=999999)

birds <- song.FromDataObj(wrens) # use song.FromTextFile() for text files
birds


# List all files in the current directory that start with "song_"
song_files <- list.files(path = ".", pattern = "^fixed", all.files = FALSE, full.names = TRUE)

# Print the results
print(song_files)

new_file_str <- substring(songname, 7)
print(new_file_str)

test_file = song_files[1]
print(test_file)

for (songname in song_files) {
  print(paste("running SONG on: ", songname))
  singing_bout <- song.FromTextFile(songname)
  model <- song.Simulate(singing_bout, num.rand = 1000, overlap.function = "song.TimeOverlap", randomize.function = "song.RandomizeSampleGaps")
  song.Summarize(model)
  content <- as.character(song.Summarize(model))
  new_file_str <- substring(songname, 13)
  filename <- paste0("fixed_output", new_file_str)
  writeLines(content, filename)
  print(paste("File saved as:", filename))
}

song.Summarize(model)
print(content)
song.R

test <- song.FromTextFile(test_file)            
#reads raw data from text file 

Time <- song.Simulate(test, num.rand = 100, overlap.function = "song.TimeOverlap", randomize.function = "song.RandomizeSampleGaps") 
#Does the actual analysis with simulated sequences as described by Masco et al. (2016) 

song.Summarize(model) 
#shows the results, which can be copied to your Excel file 
content <- as.character(song.Summarize(Time))
writeLines(content, "sampleSONG.txt")

Num <- song.Simulate(test, num.rand = 1000, overlap.function = "song.NumOverlap", randomize.function = "song.RandomizeSampleGaps") 
song.Summarize(Num) 

#The above two lines do the same sequence again but with regard to Number of songs that overlap.

