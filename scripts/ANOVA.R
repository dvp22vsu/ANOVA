# Packages:
library(here)
library(tidyverse)
library(GGally)

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

# Linear Model:
lsmodel_Frog <- lm(days ~ temperature, data=Frogs)
summary(lsmodel_Frog)

anova(lsmodel_Frog)

broom::tidy(lsmodel_Frog, conf.int=T)

# Plot of Linear Model:
plot(lsmodel_Frog)

# Production of a Suitable Figure:
Frogs %>%
  ggplot(aes(x=temperature, y=days))+
  geom_boxplot()+
  labs(x="Temperature (°C)", y="Number of Days to Spawning")+
  theme_classic()