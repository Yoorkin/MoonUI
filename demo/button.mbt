// ======================================================================
// button with multiply style in normal/highlight/pressed state

fn button2(text : String) -> @ui.Element {
  Stack(
    [
      @ui.multi_style(
        Margin(
          5,
          5,
          5,
          5,
          Roundrect(Js_repr("#22a6b3"), Js_repr("#7ed5dfb5"), 10),
        ),
        [
          Highlight(
            Margin(
              0,
              0,
              0,
              0,
              Roundrect(Js_repr("#7ed6df"), Js_repr("#7ed5dfb5"), 10),
            ),
          ),
          Pressed(
            Margin(
              10,
              10,
              10,
              10,
              Roundrect(Js_repr("#137983"), Js_repr("#7ed5dfb5"), 10),
            ),
          ),
        ],
      ),
      Text(@ui.Font::default(), "Sample Button", Js_repr("white")),
    ],
  )
}

pub fn panel(child : @ui.Element) -> @ui.Element {
  Margin(
    5,
    5,
    5,
    5,
    Stack(
      [
        Roundrect(Js_repr("#ffffff"), Js_repr("#f1f2f6"), 10),
        Margin(15, 15, 15, 15, child),
      ],
    ),
  )
}

pub fn button_layout() -> @ui.Element {
  panel(
    Row(
      3,
      5,
      [
        button2("button 1"),
        button2("button 2"),
        Column(2, 10, [button2("button 3"), button2("button 4")]),
      ],
    ),
  )
}
