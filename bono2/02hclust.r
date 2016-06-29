png("hclust.png")
d <- read.table('matrix.txt')
c <- hclust(as.dist(d), method = 'average')
plot(c, hang=-1)
dev.off()

