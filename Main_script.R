install.packages("tidyverse")
library(tidyverse)

install.packages("ggplot2")
library(ggplot2)

install.packages("psych")
library(psych)

id <- "1EggtVIwEYhWKgSUyKMTZOL3vVktEarl8" # google file ID
data <- read_csv2(sprintf("https://drive.google.com/u/0/uc?id=1EggtVIwEYhWKgSUyKMTZOL3vVktEarl8&export=download", id)) #использование именно csv2 позволяет преобразовать числовые данные с запятой в читаемые для R

data
view(data)

# Препроцессинг данных ----------------------------------------------------

#Создаем столбцы, где делим на группы по соотношению cd4/cd8 и по тяжести эмфиземы, двигаем их по соседству с исходными данными

dataPrep <- data %>% 
  mutate(cd4_cd8_ratio_range = case_when(cd4_cd8_ratio < 0.4 ~ "<0.4",
                                         cd4_cd8_ratio >= 0.4 & cd4_cd8_ratio <= 1 ~ "0.4-1",
                                         .default = ">1")) %>% 
  relocate(cd4_cd8_ratio_range, .after = cd4_cd8_ratio) %>% 
  mutate(emphysema_severity_assessment = case_when(emphysema_severity <= 1 ~ "Trace_or_none",
                                                   emphysema_severity > 1 ~ "Mild_or_worse")) %>% 
  relocate(emphysema_severity_assessment, .after = emphysema_severity) %>% 
  view()


describe(dataPrep$age_at_enrollment)

