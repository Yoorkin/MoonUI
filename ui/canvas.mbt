// ==================== canvas ====================
pub fn clear_rect(x : Int, y : Int, w : Int, h : Int) = "canvas" "clearRect"

pub fn fill_rect(x : Int, y : Int, w : Int, h : Int) = "canvas" "fillRect"

pub fn stroke_rect(x : Int, y : Int, w : Int, h : Int) = "canvas" "strokeRect"

pub fn fill_ellipse(x : Int, y : Int, w : Int, h : Int) = "canvas" "fillEllipse"

pub fn stroke_ellipse(x : Int, y : Int, w : Int, h : Int) = "canvas" "strokeEllipse"

pub fn set_color(color : Js_string) = "canvas" "setColor"

pub fn fill_text(text : Js_string, x : Int, y : Int) = "canvas" "fillText"

pub fn set_font(font : Js_string) = "canvas" "setFont"

pub fn measure_text_width(text : Js_string) -> Int = "canvas" "measureTextWidth"

pub fn measure_text_height(text : Js_string) -> Int = "canvas" "measureTextHeight"

pub fn measure_text(text : Js_string) -> (Int, Int) {
  (measure_text_width(text), measure_text_height(text))
}

pub fn fill_round_rect(
  x : Int,
  y : Int,
  width : Int,
  height : Int,
  round : Int
) = "canvas" "fillRoundRect"

pub fn stroke_round_rect(
  x : Int,
  y : Int,
  width : Int,
  height : Int,
  round : Int
) = "canvas" "strokeRoundRect"

pub fn stroke_line(x1 : Int, y1 : Int, x2 : Int, y2 : Int) = "canvas" "strokeLine"
