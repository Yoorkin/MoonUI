// =====================================================================
// nested margin
pub func nested_margin_layout() -> @ui.Element {
  @ui.Element::Margin(
    10,10,10,10,
    @ui.Element::Stack([
      @ui.Element::Rectangle(
        @ui.Color::Js_repr("#22a6b330"),
        @ui.Color::Js_repr("black"),
      ),
      @ui.Element::Margin(
        20,20,20,20,
        @ui.Element::Stack([
          @ui.Element::Rectangle(
            @ui.Color::Js_repr("#22a6b330"),
            @ui.Color::Js_repr("black"),
          ),
          @ui.Element::Margin(
            30,30,30,30,
            @ui.Element::Stack([
              @ui.Element::Rectangle(
                @ui.Color::Js_repr("#22a6b330"),
                @ui.Color::Js_repr("black"),
              ),
            ]),
          ),
        ]),
      ),
    ]),
  )
}
