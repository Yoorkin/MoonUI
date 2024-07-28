// ======================================================================
// button with multiply style in normal/highlight/pressed state

fn button2(text : String) -> @ui.Element {
  Stack(
    [
      @ui.multi_style(
        Margin(
          (5, 5, 5, 5),
          Roundrect(Color("#22a6b3"), Color("#7ed5dfb5"), 10),
        ),
        [
          Highlight(
            Margin(
              (0, 0, 0, 0),
              Roundrect(Color("#7ed6df"), Color("#7ed5dfb5"), 10),
            ),
          ),
          Pressed(
            Margin(
              (10, 10, 10, 10),
              Roundrect(Color("#137983"), Color("#7ed5dfb5"), 10),
            ),
          ),
        ],
      ),
      Text(@ui.Font::default(), "Sample Button", Color("white")),
    ],
  )
}

pub fn panel(child : @ui.Element) -> @ui.Element {
  Margin(
    (5, 5, 5, 5),
    Stack(
      [
        Roundrect(Color("#ffffff"), Color("#f1f2f6"), 10),
        Margin((15, 15, 15, 15), child),
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
