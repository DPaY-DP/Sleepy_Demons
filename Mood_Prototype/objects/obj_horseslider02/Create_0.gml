image_xscale = size * global.GUIScale;
image_yscale = size * global.GUIScale;

image_index = 1;


amountStepsMove = 30;
move = global.GUIScale * 32 * size;
stepMove = move / amountStepsMove;

amountStepsRotate = ceil(amountStepsMove * 1.5);
stepRotate = 180 / amountStepsRotate;

counterStepsMove = 0;
counterStepsRotate = 0;

directionMove = "down";