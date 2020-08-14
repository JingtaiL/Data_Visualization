library(ggplot2)
library(dplyr)

face <- expand.grid(x = 1:8, y = 1:8) %>%
  filter(!(x %in% c(1, max(x)) & y %in% c(1, max(y)))) %>%
  filter(!(x %in% c(2, max(x) - 1) & y %in% c(1, max(y)))) %>%
  filter(!(x %in% c(1, max(x)) & y %in% c(2, max(y) - 1)))

left_eye <- data.frame(x = c(2.5,3.5,3), y = c(5.5,5.5,6))
right_eye <- data.frame(x = c(5.5,6.5,6), y = c(5.5,5.5,6))
dimples <- data.frame(x = c(2,7),y = c(4,4))
smile1 <- data.frame(x = c(3.25,5.75),y = c(3,3))
smile2 <- data.frame(x = c(4,5),y = c(2.25,2.25))

ggplot() +
  geom_tile(
    data = face, aes(x = x, y = y), width = 1, height = 1,
    size = 0.5, fill = "yellow", colour = "black"
  ) +
  geom_tile(
    data = left_eye, aes(x = x, y = y), width = 0.5, height = 1,
    fill = "black", colour = "black"
  ) + geom_tile(
    data = right_eye, aes(x = x, y = y), width = 0.5, height = 1,
    fill = "black", colour = "black"
  ) + geom_tile(
    data = dimples,aes(x = x, y = y),width = 1, height = 1,
    fill = "pink",alpha = 0.8
  ) + geom_tile(
    data = smile1, aes(x = x, y = y), width = 0.5, height = 1,
    fill = "black", colour = "black"
  ) + geom_tile(
    data = smile2, aes(x = x, y = y), width = 1, height = 0.5,
    fill = "black", colour = "black"
  ) + coord_equal() +
  theme_void()