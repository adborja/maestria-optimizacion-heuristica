require(grDevices)
require(graphics)
filled.contour(volcano, color.palette = terrain.colors, asp = 1)
title(main = "volcano data: filled contour map")

x = sample(1:87, 15)
y = sample(1:61, 15)
a = sample(1:15)
max = 0

for (i in 1:15) {
  for (j in 1:15) {
    a[i] = volcano[x[i],y[j]]
    if (a[i] > max) {
      max = a[i]
    }
  }
} 

plot(1:15, a, type = 'l')
print(max)