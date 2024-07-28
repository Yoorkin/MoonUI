// ======================================================================
// button with multiply style in normal/highlight/pressed state

fn button2(text : String) -> @ui.Element {
  @ui.Element::Stack(
    [
      @ui.multi_style(
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
        [
          @ui.Style::Highlight(
            @ui.Element::Margin(
              0,
              0,
              0,
              0,
              @ui.Element::Roundrect(
                @ui.Color::Js_repr("#7ed6df"),
                @ui.Color::Js_repr("#7ed5dfb5"),
                10,
              ),
            ),
          ),
          @ui.Style::Pressed(
            @ui.Element::Margin(
              10,
              10,
              10,
              10,
              @ui.Element::Roundrect(
                @ui.Color::Js_repr("#137983"),
                @ui.Color::Js_repr("#7ed5dfb5"),
                10,
              ),
            ),
          ),
        ],
      ),
      @ui.Element::Text(
        @ui.Font::default(),
        "Sample Button",
        @ui.Color::Js_repr("white"),
      ),
    ],
  )
}

pub fn panel(child : @ui.Element) -> @ui.Element {
  @ui.Element::Margin(
    5,
    5,
    5,
    5,
    @ui.Element::Stack(
      [
        @ui.Element::Roundrect(
          @ui.Color::Js_repr("#ffffff"),
          @ui.Color::Js_repr("#f1f2f6"),
          10,
        ),
        @ui.Element::Margin(15, 15, 15, 15, child),
      ],
    ),
  )
}

pub fn button_layout() -> @ui.Element {
  panel(
    @ui.Element::Row(
      3,
      5,
      [
        button2("button 1"),
        button2("button 2"),
        @ui.Element::Column(2, 10, [button2("button 3"), button2("button 4")]),
      ],
    ),
  )
}
