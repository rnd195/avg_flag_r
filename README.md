# Average flag in R

This script provides a simple way to turn a list of 300x200 px png images (flags for example) into an "average" picture. Each pixel on an image can be represented by *three* numbers ([plus the alpha levels](https://en.wikipedia.org/wiki/RGBA_color_model)), therefore, numerical operations are possible. 

By loading the images using the readPNG package, we obtain the numerical values of each pixel's color on the image. These values can be transformed into matrices or vectors. By adding all the vectors into one and multiplying each value by 1/(number of images), we can find the "average" color value of all pixels, thus, the "average" image.

In my case, I used flags of Czech regions and districts to create two "average" flags.

## Average flag of Czech regions
![Average flag - regions](https://i.imgur.com/xEWdQHp.jpg)


## Average flag of Czech district towns
![Average flag - district towns](https://i.imgur.com/WMfomZE.jpg)

There are 76+1 (the capital) district towns in the Czech Republic. However, some districts do not have their own flag, notably Brno-venkov, Praha-západ and 3 more (see districts/no_flag.txt). Therefore, there are only 72 flags in this dataset.

#### Additional information
This project was inspired by [u/Udzu's post on reddit](https://www.reddit.com/r/dataisbeautiful/comments/85l10h/average_flags_of_the_world_means_modes_and/) and [baptiste's answer](https://stackoverflow.com/questions/11306075/how-to-create-rgb-image-from-three-matrices-in-r) on the stackoverflow forum.

The "Releases" page of this project unfortunately does not seem to be working properly -- possibly due to the fact that this repository has been imported from another git hosting platform.