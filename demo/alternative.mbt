// ======================================================================
// button with alternative style

fn button(text : String) -> @ui.Element {
  Stack(
    [
      Alternative(
        @ui.is_cursor_inside,
        Margin(
          (5, 5, 5, 5),
          Roundrect(Color("#7ed6df"), Color("#7ed5dfb5"), 10),
        ),
        Margin(
          (5, 5, 5, 5),
          Roundrect(Color("#22a6b3"), Color("#7ed5dfb5"), 10),
        ),
      ),
      Text(@ui.Font::default(), "Sample Button", Color("white")),
    ],
  )
}

pub fn alternative_layout() -> @ui.Element {
  Margin((100, 100, 100, 100), button("hello world"))
}
