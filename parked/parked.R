
library("tidyverse")
lyrics <- read_file("lyrics/beatles.txt")


# cleaning the lyrics
# remove punctuation
clean_ly <- str_replace_all(lyrics, "[\n,\"()-.]"," ")
clean_ly <- str_to_lower(clean_ly)
raw <- data.frame(words = c(str_split_1(clean_ly," ")))
data <- raw$words[-which(raw$words == "")] |> table() |> sort(decreasing = TRUE)
data <- as.data.frame(data)
colnames(data) = c("word","count")
data <- data[-which(data$count == 1),]


# plot frequencies
plt <- ggplot(data,aes(x=word,y=count)) +
geom_col(aes(fill=word), show.legend=FALSE) +
scale_fill_viridis_d()+
labs(x="Word", y="Count", title="Word Frequency") +
theme_classic()


ggsave("lyrics.png", plot = plt)



