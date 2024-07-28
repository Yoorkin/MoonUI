
// ==================== js string ====================
pub type JsString
fn to_js_string_begin() = "string" "beginConversion"
fn set_js_string_char(i : Int, x : Char) = "string" "pushChar"
fn to_js_string_end() -> JsString = "string" "endConversion"
fn debug_js_string(str : JsString) = "string" "debugString"

pub fn from_string(x : String) -> JsString {
  to_js_string_begin()
  let mut i = 0
  while i < x.length() {
    set_js_string_char(i, x[i])
    i = i + 1
  }
  to_js_string_end()
}