

// ==================== event ====================

pub struct Mouse{
  mut is_lbtn_pressed : Bool
  mut is_rbtn_pressed : Bool
  mut is_mbtn_pressed : Bool
  mut cursor_x : Int
  mut cursor_y : Int
}

pub struct Config{
  mut width : Int
  mut height : Int
  mouse : Mouse
}

let config : Config = {
  width: 0,
  height: 0,
  mouse: {
    is_lbtn_pressed: false,
    is_rbtn_pressed: false,
    is_mbtn_pressed: false,
    cursor_x: 0,
    cursor_y: 0,
  },
}

