A tiny, and awful, little processing (read: java) program I wrote to  fill in the black space my computers auto-screensaver left when pulling images from the screensaver folder.

Basically, it takes in a photo (of exactly 600x900dpi) and adds static to the sides. Then I manually put te new image, with static stides, into a neural network such as Ostagram or Dreamsscope. Then I manually download the result. 

Features:
-written in processing, actually opens a processing window when you 	run it, beyond jut saving the new file
-written for files of exactly 600x900 dimensions
-useful for monitors of exactly 1440x900 dimensions
-zero scaling
-static is totally unware. There's an obvious transition from regular image file to static. No sampling of the target images average colours, or borders, or anything crazy like that.

Eventual Goals:
-have a single, compiled file that doesn't run in processing
-have a main file that accepts an image file input
-also it should read system dimensions instead of treating them as static vars (config file)
-scaling of target image (within reason) instead of assuming it is scaled to fit screen already
-any sort of testing
-any sort of error catching
 