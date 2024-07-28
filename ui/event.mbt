pub fn initialize(w : Int, h : Int) -> Unit {
  println("init -- w: \(w), h: \(h)")
  config.height = w
  config.width = h
}

pub fn on_mouse_down(
  btn_state : Int,
  btn_index : Int,
  x : Int,
  y : Int
) -> Unit {
  println(
    "on_mouse_down -- bin_state: \(btn_state), bin_index: \(btn_index), x: \(x), y: \(y)",
  )
  config.mouse.is_lbtn_pressed = true
  on_draw()
}

pub fn on_mouse_up(btn_state : Int, btn_index : Int, x : Int, y : Int) -> Unit {
  println(
    "on_mouse_up -- bin_state: \(btn_state), bin_index: \(btn_index), x: \(x), y: \(y)",
  )
  config.mouse.is_lbtn_pressed = false
  on_draw()
}

pub fn on_mouse_move(
  btn_state : Int,
  btn_index : Int,
  x : Int,
  y : Int
) -> Unit {
  // println("on_mouse_move -- x: \(x), y: \(y)")
  config.mouse.cursor_x = x
  config.mouse.cursor_y = y
  on_draw()
}

pub fn on_draw() -> Unit {
  println("drawing")
  clear_rect(0, 0, config.width, config.height)
  render(
    window.element,
    { left: 0, top: 0, width: config.width, height: config.height },
  )
}
