class Z3::Ast
  def +(b : self) : self
    @context.mk_add(self, b)
  end

  def *(b : self) : self
    @context.mk_mul(self, b)
  end

  def -(b : self) : self
    @context.mk_sub(self, b)
  end
end
