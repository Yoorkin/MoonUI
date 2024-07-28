fn main {
  @ui.layout(@demo.button_layout())
}

pub fn initialize(w : Int, h : Int) -> Unit {
  @ui.initialize(w, h)
}

pub fn on_mouse_down(
  btn_state : Int,
  btn_index : Int,
  x : Int,
  y : Int
) -> Unit {
  @ui.on_mouse_down(btn_state, btn_index, x, y)
}

pub fn on_mouse_up(btn_state : Int, btn_index : Int, x : Int, y : Int) -> Unit {
  @ui.on_mouse_up(btn_state, btn_index, x, y)
}

pub fn on_mouse_move(
  btn_state : Int,
  btn_index : Int,
  x : Int,
  y : Int
) -> Unit {
  @ui.on_mouse_move(btn_state, btn_index, x, y)
}
