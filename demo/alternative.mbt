// ======================================================================
// button with alternative style

fn button(text : String) -> @ui.Element {
  @ui.Element::Stack(
    [
      @ui.Element::Alternative(
        @ui.is_cursor_inside,
        @ui.Element::Margin(
          5,
          5,
          5,
          5,
          @ui.Element::Roundrect(
            @ui.Color::Js_repr("#7ed6df"),
            @ui.Color::Js_repr("#7ed5dfb5"),
            10,
          ),
        ),
        @ui.Element::Margin(
          5,
          5,
          5,
          5,
          @ui.Element::Roundrect(
            @ui.Color::Js_repr("#22a6b3"),
            @ui.Color::Js_repr("#7ed5dfb5"),
            10,
          ),
        ),
      ),
      @ui.Element::Text(
        @ui.Font::default(),
        "Sample Button",
        @ui.Color::Js_repr("white"),
      ),
    ],
  )
}

pub fn alternative_layout() -> @ui.Element {
  @ui.Element::Margin(100, 100, 100, 100, button("hello world"))
}
