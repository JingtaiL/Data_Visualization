library(ggplot2)
library(ggforce)
library(cowplot)
library(magick)

# 准备食材
circleFun <- function(center = c(0,0),diameter = 1, npoints = 100){
  r = diameter / 2
  tt <- seq(0,2*pi,length.out = npoints)
  xx <- center[1] + r * cos(tt)
  yy <- center[2] + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}

full_circle <- circleFun(c(0,0),diameter = 8,npoints = 100)
half_circle <- full_circle %>% filter(y < 0)
cusion_left <- data.frame(x1 = -2,x2 = -2, y1 = -4, y2 =-3.464)
cusion_right <- data.frame(x1 = 2,x2 = 2, y1 = -4, y2 =-3.464)
cusion_bottom <- data.frame(x1 = -2,x2 = 2, y1 = -4, y2 = -4)
noodle1 <- data.frame(x = c(-1.8,-1,-1,-1.8), y = c(2.76,2.8,0,0))
noodle2 <- data.frame(x = c(-0.7,0.2,0.2,-0.7), y = c(2.78,2.8,-0.4,-0.4))
noodle3 <- data.frame(x = c(0.5,1.2,1.2,0.5), y = c(2.8,2.82,-0.7,-0.7))
img <- file.path(paste0(getwd(),"/dawankuanmian.jpeg"))


# 开始下面
dawan_kuanmian <- ggplot() +
  # 大碗
  geom_ellipse(aes(x0 = 0, y0 = 0, a = 4, b = 1.5, angle = 0)) +
  geom_path(data = half_circle,aes(x = x,y = y))+
  geom_segment(data = cusion_left, aes(x = x1, y = y1, xend = x2, yend = y2))+
  geom_segment(data = cusion_right, aes(x = x1, y = y1, xend = x2, yend = y2))+
  geom_segment(data = cusion_bottom, aes(x = x1, y = y1, xend = x2, yend = y2))+
  # 筷子
  geom_polygon(aes(x = c(-2, 6, 6, -2), y = c(2.2, 2.2, 2.5, 2.35)),
               fill = "firebrick4")+
  geom_polygon(aes(x = c(-2, 6, 6, -2), y = c(2.6, 2.6, 2.9, 2.75)),
               fill = "firebrick4")+
  # 宽面
  geom_polygon(data = noodle1, aes(x = x, y = y),fill = "ivory")+
  geom_polygon(data = noodle2, aes(x = x, y = y),fill = "ivory")+
  geom_polygon(data = noodle3, aes(x = x, y = y),fill = "ivory")+
  theme_void() +
  theme(panel.background = element_rect(fill = "gray90",color = "gray90"))

# 开吃
ggdraw()+
  draw_plot(dawan_kuanmian)+
  draw_image(img,hjust = -0.4, vjust = -0.15, width = 0.45, height = 0.35, scale = 0.7)



