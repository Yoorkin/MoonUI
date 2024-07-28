struct Window {
  mut element : Element
}

let window : Window = { element: Rectangle(Color::empty(), Color::empty()) }

pub enum Color {
  Js_repr(String)
}

pub fn Color::empty() -> Color {
  Js_repr("rgba(0,0,0,0)")
}

pub fn js_color(self : Color) -> Js_string {
  match self {
    Js_repr(x) => x.to_js_string()
  }
}

pub enum Edge {
  Top
  Right
  Bottom
  Left
}

pub struct Font {
  family : String
  size : Int
}

pub fn Font::default() -> Font {
  { family: "sans-serif", size: 22 }
}

pub fn to_string(self : Font) -> String {
  self.size.to_string() + "px " + self.family
}

pub struct Area {
  left : Int
  top : Int
  width : Int
  height : Int
}

pub fn to_string(self : Area) -> String {
  let { left, top, width, height } = self
  "Area{ left: \(left), top: \(top), width: \(width), height: \(height) }"
}

pub fn position(left : Int, top : Int, width : Int, height : Int) -> Area {
  { left, top, width, height }
}

// pub enum Direction {
//   Vertical
//   Horizontal
// }

pub enum Handler {
  Click(() -> Unit)
}

pub enum Element {
  Stack(Array[Element])
  Margin(Int, Int, Int, Int, Element)
  Fixed(Int, Int, Int, Int, Element)
  Grid(Int, Int, Int, Array[(Int, Int, Element)])
  Column(Int, Int, Array[Element])
  Row(Int, Int, Array[Element])
  Alternative((Config, Area) -> Bool, Element, Element)
  Event(Handler, Element)
  Rectangle(Color, Color)
  Roundrect(Color, Color, Int)
  Ellipse(Color, Color)
  Text(Font, String, Color)
  Line(Edge, Color)
}

pub enum Style {
  Highlight(Element)
  Pressed(Element)
}

pub fn Style::default() -> Style {
  Highlight(Element::Rectangle(Color::empty(), Color::empty()))
}

pub fn multi_style(normal : Element, styles : FixedArray[Style]) -> Element {
  fn go(xs : @immut/list.T[Style]) {
    match xs {
      Cons(Highlight(x), xs) =>
        Element::Alternative(
          fn(config, area) {
            is_cursor_inside(config, area) && not(config.mouse.is_lbtn_pressed)
          },
          x,
          go(xs),
        )
      Cons(Pressed(x), xs) =>
        Element::Alternative(
          fn(config, area) {
            is_cursor_inside(config, area) && config.mouse.is_lbtn_pressed
          },
          x,
          go(xs),
        )
      Nil => normal
    }
  }

  go(@immut/list.of(styles))
}

pub fn right(self : Area) -> Int {
  self.left + self.width
}

pub fn bottom(self : Area) -> Int {
  self.top + self.height
}

pub fn is_cursor_inside(config : Config, area : Area) -> Bool {
  let x = config.mouse.cursor_x
  let y = config.mouse.cursor_y
  config.mouse.cursor_x > area.left && config.mouse.cursor_x < area.right() && config.mouse.cursor_y >
  area.top && config.mouse.cursor_y < area.bottom()
}

pub fn render(element : Element, area : Area) -> Unit {
  match element {
    Stack(xs) => xs.iter().each(fn(x) { render(x, area) })
    Margin(t, r, b, l, child) =>
      render(
        child,
        {
          left: area.left + l,
          top: area.top + t,
          width: area.width - l - r,
          height: area.height - t - b,
        },
      )
    Fixed(x, y, width, height, child) =>
      render(child, { left: area.left + x, top: area.top + y, width, height })
    Grid(col, row, gap, xs) => {
      let col_size = area.width / col
      let row_size = area.height / row
      xs.iter().each(
        fn(x) {
          let (x, y, elem) = x
          render(
            elem,
            {
              left: area.left + x * col_size,
              top: area.top + y * row_size,
              width: col_size - gap,
              height: row_size - gap,
            },
          )
        },
      )
    }
    Column(n, gap, xs) => {
      let size = (area.width - (n - 1) * gap) / n
      xs.iter().eachi(
        fn(i, x) {
          match i {
            0 => render(x, { ..area, left: area.left + i * size, width: size })
            _ =>
              render(
                x,
                { ..area, left: area.left + i * size + gap, width: size },
              )
          }
        },
      )
    }
    Row(n, gap, xs) => {
      let size = (area.height - (n - 1) * gap) / n
      xs.iter().eachi(
        fn(i, x) {
          match i {
            0 => render(x, { ..area, top: area.top + i * size, height: size })
            _ =>
              render(
                x,
                { ..area, top: area.top + i * size + gap, height: size },
              )
          }
        },
      )
    }
    Event(handler, child) => {
      match handler {
        Click(f) => if is_cursor_inside(config, area) { f() }
      }
      render(child, area)
    }
    Alternative(p, t, f) =>
      if p(config, area) {
        render(t, area)
      } else {
        render(f, area)
      }
    Rectangle(back, fore) => {
      println("rectangle!")
      set_color(back.js_color())
      fill_rect(area.left, area.top, area.width, area.height)
      set_color(fore.js_color())
      stroke_rect(area.left, area.top, area.width, area.height)
    }
    Ellipse(back, fore) => {
      set_color(back.js_color())
      fill_ellipse(area.left, area.top, area.width, area.height)
      set_color(fore.js_color())
      fill_ellipse(area.left, area.top, area.width, area.height)
    }
    Roundrect(back, fore, round) => {
      set_color(back.js_color())
      fill_round_rect(area.left, area.top, area.width, area.height, round)
      set_color(fore.js_color())
      stroke_round_rect(area.left, area.top, area.width, area.height, round)
    }
    Text(font, text, color) => {
      set_font(font.to_string().to_js_string())
      set_color(color.js_color())
      let js_str = text.to_js_string()
      let (w, h) = measure_text(js_str)
      let x = area.left + (area.width - w) / 2
      let y = area.top + (area.height - h) / 2
      fill_text(js_str, x, y)
    }
    Line(edge, color) => {
      let (x1, y1, x2, y2) = match edge {
        Top => (area.left, area.top, area.right(), area.top)
        Right => (area.right(), area.top, area.right(), area.bottom())
        Bottom => (area.left, area.bottom(), area.right(), area.bottom())
        Left => (area.left, area.top, area.left, area.bottom())
      }
      set_color(color.js_color())
      stroke_line(x1, y1, x2, y2)
    }
  }
}

pub fn layout(element : Element) -> Unit {
  println("layout seted")
  window.element = element
}
