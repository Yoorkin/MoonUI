// ======================================================================
// button with alternative style

fn button(text : String) -> @ui.Element {
  Stack(
    [
      Alternative(
        @ui.is_cursor_inside,
        Margin(
          5,
          5,
          5,
          5,
          Roundrect(Js_repr("#7ed6df"), Js_repr("#7ed5dfb5"), 10),
        ),
        Margin(
          5,
          5,
          5,
          5,
          Roundrect(Js_repr("#22a6b3"), Js_repr("#7ed5dfb5"), 10),
        ),
      ),
      Text(@ui.Font::default(), "Sample Button", Js_repr("white")),
    ],
  )
}

pub fn alternative_layout() -> @ui.Element {
  Margin(100, 100, 100, 100, button("hello world"))
}
