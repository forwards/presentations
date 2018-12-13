library(magick)
f <- list.files(pattern = "png")
image_write(image_trim(image_read(f)), f)
