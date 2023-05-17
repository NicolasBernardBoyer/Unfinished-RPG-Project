image_alpha -= 0.04;
image_xscale += 0.01;
image_yscale += 0.01;
if (vspeed < 0) image_alpha = 1.0;
if (y > ystart) vspeed = 0;
if (image_alpha <= 0) instance_destroy();