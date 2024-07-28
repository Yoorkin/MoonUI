// =====================================================================
// nested margin
pub fn nested_margin_layout() -> @ui.Element {
  Margin(
    (10, 10, 10, 10),
    Stack(
      [
        Rectangle(Color("#22a6b330"), Color("black")),
        Margin(
          (20, 20, 20, 20),
          Stack(
            [
              Rectangle(Color("#22a6b330"), Color("black")),
              Margin(
                (30, 30, 30, 30),
                Stack([Rectangle(Color("#22a6b330"), Color("black"))]),
              ),
            ],
          ),
        ),
      ],
    ),
  )
}
