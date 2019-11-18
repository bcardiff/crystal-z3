class Z3::Context
  def mk_xor(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_xor(self, a, b)
  end

  def mk_or(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_or(self, 2, unsafe_ast_args(a, b))
  end

  def mk_and(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_and(self, 2, unsafe_ast_args(a, b))
  end

  def mk_implies(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_implies(self, a, b)
  end
end
