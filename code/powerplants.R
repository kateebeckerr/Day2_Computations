#text editor for code where code only runs if you want it to, this is a whole code chunk 
#data wrangling aand viz
#can execute code but doesnt render to a document 
library(tidyverse)
library(here)
library(janitor)

#use janitor to clean 
#filtering , fitler only keep,
#keeps  boolean to see if matching condition, filter, dont need dataset name we used pipe

plants <- read_csv(here("data", "power_plants.csv")) %>% 
  clean_names()

#only want plant names with alabama, if conditional statement returns true keep row but if false dont keep row in need susbet, it iterates over each rowand keeping or throwing out observation or rows whetehr or not condition returns true or false 
alabama_plants <- plants %>% 
  filter(state_name == "Alabama")

alabama_plot <- ggplot(data = alabama_plants, aes(x = install_mw, y = total_mw)) +
  geom_point()
  
#saves image 
ggsave(filename = here("figures", "alabama_plants.jpg"), plot = alabama_plot)


