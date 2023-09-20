
// ==================== canvas ====================
pub func clear_rect(x : Int, y : Int, w : Int, h : Int) = "canvas" "clearRect"
pub func fill_rect(x : Int, y : Int, w : Int, h : Int) = "canvas" "fillRect"
pub func stroke_rect(x : Int, y : Int, w : Int, h : Int) = "canvas" "strokeRect"
pub func fill_ellipse(x : Int, y : Int, w : Int, h : Int) = "canvas" "fillEllipse"
pub func stroke_ellipse(x : Int, y : Int, w : Int, h : Int) = "canvas" "strokeEllipse"
pub func set_color(color : Js_String) = "canvas" "setColor"
pub func fill_text(text : Js_String, x : Int, y : Int) = "canvas" "fillText"
pub func set_font(font : Js_String) = "canvas" "setFont"
pub func measure_text_width(text : Js_String) -> Int = "canvas" "measureTextWidth"
pub func measure_text_height(text : Js_String) -> Int = "canvas" "measureTextHeight"
pub func measure_text(text : Js_String) -> (Int,Int) {
  (measure_text_width(text), measure_text_height(text))
}
pub func fill_round_rect(x : Int, y : Int, width : Int, height : Int, round : Int) = "canvas" "fillRoundRect"
pub func stroke_round_rect(x : Int, y : Int, width : Int, height : Int, round : Int) = "canvas" "strokeRoundRect"
pub func stroke_line(x1 : Int, y1 : Int, x2 : Int, y2 : Int) = "canvas" "strokeLine"