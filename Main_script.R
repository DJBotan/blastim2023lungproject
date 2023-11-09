install.packages("tidyverse")
library(tidyverse)

id <- "1EggtVIwEYhWKgSUyKMTZOL3vVktEarl8" # google file ID
data <- read_delim(sprintf("https://drive.google.com/u/0/uc?id=1EggtVIwEYhWKgSUyKMTZOL3vVktEarl8&export=download", id), delim = ";")

view(data)

data %>% 
pull(cd4_cd8_ratio) %>% 
  gsub(",", ".", .) %>% 
  as.numeric()

data
