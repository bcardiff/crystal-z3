class Z3::Context
  def mk_eq(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_eq(self, a, b)
  end

  def mk_distinct(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_distinct(self, 2, unsafe_ast_args(a, b))
  end

  def mk_lt(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_lt(self, a, b)
  end

  def mk_le(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_le(self, a, b)
  end

  def mk_gt(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_gt(self, a, b)
  end

  def mk_ge(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_ge(self, a, b)
  end
end
