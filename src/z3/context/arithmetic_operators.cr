class Z3::Context
  def mk_add(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_add(self, 2, unsafe_ast_args(a, b))
  end

  def mk_mul(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_mul(self, 2, unsafe_ast_args(a, b))
  end

  def mk_sub(a : Ast, b : Ast)
    assert_context(a, b)
    wrap_ast LibZ3.mk_sub(self, 2, unsafe_ast_args(a, b))
  end
end
