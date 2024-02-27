# Packages:
library(here)
library(tidyverse)

# Import Data:
Frogs <- read_csv(here("data", "frogs_messy_data.csv"))

# Tidy Data:
Frogs <- Frogs %>%
  rename("13" = Temperature13,
         "18" = Temperature18,
         "25" = Temperature25, 
         Frogspawn_ID = `Frogspawn sample id`) %>% 
  pivot_longer(`13`:`25`, names_to="temperature", values_to="days") %>%
  drop_na(days)