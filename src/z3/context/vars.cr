class Z3::Context
  def mk_bool_var(name : String)
    mk_var(name, self.bool_sort)
  end

  def mk_int_var(name : String)
    mk_var(name, self.int_sort)
  end

  def mk_real_var(name : String)
    mk_var(name, self.real_sort)
  end

  def mk_bitvector_var(name : String, size : Int32)
    mk_var(name, self.bit_vector_sort(size))
  end

  private def mk_var(name : String, ty : Sort)
    s = Symbol.from_string(self, name)
    wrap_ast LibZ3.mk_const(self, s, ty)
  end

  protected def wrap_ast(a : LibZ3::Ast)
    Ast.new(self, a)
  end
end
