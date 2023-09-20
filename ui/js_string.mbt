
// ==================== js string ====================
type Js_String
func to_js_string_begin() = "string" "beginConversion"
func set_js_string_char(i : Int, x : Char) = "string" "pushChar"
func to_js_string_end() -> Js_String = "string" "endConversion"
func debug_js_string(str : Js_String) = "string" "debugString"

pub func to_js_string(self : String) -> Js_String {
  to_js_string_begin()
  var i = 0
  while i < self.length() {
    set_js_string_char(i, self[i])
    i = i + 1
  }
  to_js_string_end()
}
