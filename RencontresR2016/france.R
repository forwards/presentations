# rug directory: http://blog.revolutionanalytics.com/local-r-groups.html
# maps tutorial: http://datadoodlers.blogspot.co.uk/2013/04/r-beginners-plotting-locations-on-to.html
library(ggmap)
library(ggrepel)
#Using GGPLOT, plot the Base World Map
mp <- NULL
mapFrance <- borders("france", colour = "#1768A8", fill = "#1768A8") # create a layer of borders
mp <- ggplot() + mapFrance

visited <- c("Lyon", "Jouy-en-Josas", "Marseille", "Montpellier", "Paris", "Strasbourg")
ll.visited <- geocode(visited)

visit.x <- ll.visited$lon
visit.y <- ll.visited$lat

#Now Layer the cities on top
visited[5] <- "Paris (3)"
mp + geom_point(aes(x = visit.x, y = visit.y), color = "orangered", size = 3) +
    geom_label_repel(aes(x = visit.x, y = visit.y, label = visited)) + theme_nothing()
ggsave("france_rug.png")
