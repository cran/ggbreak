## ----include=FALSE------------------------------------------------------------
knitr::opts_chunk$set(warning = FALSE,
                      message = TRUE)

library(ggplot2)
library(ggbreak)
library(patchwork)

## ----fig.keep="last"----------------------------------------------------------
library(ggplot2)
library(ggbreak) 
library(patchwork)

set.seed(2019-01-19)
d <- data.frame(x = 1:20,
   y = c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22)
)
 
p1 <- ggplot(d, aes(y, x)) + geom_col(orientation="y")
d2 <- data.frame(x = c(2, 18), y = c(7, 26), label = c("hello", "world"))
p2 <- p1 + scale_x_break(c(7, 17)) + 
  geom_text(aes(y, x, label=label), data=d2, hjust=1, colour = 'firebrick')  + 
  xlab(NULL) + ylab(NULL) + theme_minimal()

p1 + p2

## -----------------------------------------------------------------------------
p2 + scale_x_break(c(18, 21))

## -----------------------------------------------------------------------------
p1 + scale_x_break(c(7, 17), scales = 1.5) + scale_x_break(c(18, 21), scales=2)

## ----fig.keep='last'----------------------------------------------------------
g <- ggplot(d, aes(x, y)) + geom_col()
g2 <- g + scale_y_break(c(7, 17), scales = 1.5) + 
  scale_y_break(c(18, 21), scale=2) + scale_y_reverse()
g + g2

## ----fig.keep='last', fig.width=10, fig.height=5------------------------------
p2 <- p1 + scale_x_break(c(7, 17)) 
p3 <- p1 + scale_x_break(c(7, 17)) + scale_x_log10()
p2 + p3

## ----message=FALSE------------------------------------------------------------
g + coord_flip() + scale_y_break(c(7, 18))

## ----message=FALSE------------------------------------------------------------
set.seed(2019-01-19)
d <- data.frame(
  x = 1:20,
  y = c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22),
  group = c(rep("A", 10), rep("B", 10)),
  face=c(rep("C", 5), rep("D", 5), rep("E", 5), rep("F", 5))
)

p <- ggplot(d, aes(x=x, y=y)) +
     geom_col(orientation="x") +
     scale_y_reverse() +
     facet_wrap(group~.,
                scales="free_y",
                strip.position="right",
                nrow=2
                ) +
     coord_flip()
pg <- p +
  scale_y_break(c(7, 17), scales="free") +
  scale_y_break(c(19, 21), scales="free")
print(pg)

## ----message=FALSE------------------------------------------------------------
pg <- pg + aes(fill=group)
print(pg)

## ----message=FALSE------------------------------------------------------------
pg + labs(title="test title", subtitle="test subtitle", tag="A tag", caption="A caption") +
     theme_bw() +
     theme(
           legend.position = c(0.8, 0.8),
           strip.placement = "outside",
           axis.title.x=element_text(size=10),
           plot.title = element_text(size = 22),
           plot.subtitle = element_text(size = 16),
           plot.tag = element_text(size = 10),
           plot.title.position = "plot",
           plot.tag.position = "topright",
           plot.caption = element_text(face="bold.italic"),

     )

## ----message=FALSE, fig.width=10, fig.height=6--------------------------------
require(ggplot2)
library(ggbreak)
set.seed(2019-01-19)
d <- data.frame(
  x = 1:20,
  y =  c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22),
  group = c(rep("A", 10), rep("B", 10))
)

p <- ggplot(d, aes(x=x, y=y)) +
     scale_y_reverse() +
     scale_x_reverse() +
     geom_col(aes(fill=group)) +
     scale_fill_manual(values=c("#00AED7", "#009E73")) +
     facet_wrap(
         group~.,
         scales="free_y",
         strip.position="right",
         nrow=2
     ) +
     coord_flip()                                                                                                                                                                                                  

p +
     scale_y_break(c(7, 10), scales=0.5, ticklabels=c(10, 11.5, 13)) +
     scale_y_break(c(13, 17), scales=0.5, ticklabels=c(17, 18, 19)) +
     scale_y_break(c(19,21), scales=1, ticklabels=c(21, 22, 23))

## ----message=FALSE, fig.width=8, fig.height=5, fig.keep="last"----------------
library(patchwork)

set.seed(2019-01-19)
d <- data.frame(
               x = 1:20,
               y = c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22)
)

p <- ggplot(d, aes(x, y)) + geom_col()
x <- p+scale_y_break(c(7, 17 ))

x + p

## ----fig.width=6, fig.height=8------------------------------------------------
p <- ggplot(economics, aes(x=date, y = unemploy, colour = uempmed)) +
  geom_line()

p + scale_wrap(n=4)

## -----------------------------------------------------------------------------
library(ggplot2)
library(ggbreak)
set.seed(2019-01-19)
d <- data.frame(
     x = 1:20,
     y = c(rnorm(5) + 4, rnorm(5) + 20, rnorm(5) + 5, rnorm(5) + 22)
 )
p <- ggplot(d, aes(x, y)) + geom_col()
p + scale_y_cut(breaks=c(7, 18), which=c(1, 3), scales=c(3, 0.5))

