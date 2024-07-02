var _frame = (image_number - 1) * (hp / hpMax);
image_index = _frame;

hp -= 0.05;
hp = clamp(hp, 0, hpMax);