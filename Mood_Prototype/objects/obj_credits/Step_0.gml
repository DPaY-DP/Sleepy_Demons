yScroll -= scroll_speed;
if (yScroll <= -text_height) {
  room_goto(room_main);
}