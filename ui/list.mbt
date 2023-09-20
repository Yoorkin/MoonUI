pub func map[T,R](self : List[T], f : (T) -> R) -> List[R] {
  match self {
    Cons(x,xs) => Cons(f(x),map(xs,f))
    Nil => Nil
  }
}

pub func iter[T](self : List[T], f : (T) -> Unit) -> Unit {
  match self {
    Cons(x,xs) => {
      f(x)
      xs.iter(f)
    }
    Nil => ()
  }
}


pub func iter[T](self : Array[T], f : (T) -> Unit) -> Unit {
  var i = 0
  while i < self.length() {
    f(self[i])
    i = i + 1
  }
}


pub func iter_i[T](self : Array[T], f : (Int,T) -> Unit) -> Unit {
  var i = 0
  while i < self.length() {
    f(i,self[i])
    i = i + 1
  }
}


pub func to_list[T : Default](self : Array[T]) -> List[T] {
  fn go(idx: Int) -> List[T] {
    if idx == self.length() { Nil } else { Cons(self[idx], go(idx + 1)) }
  }

  go(0)
}
