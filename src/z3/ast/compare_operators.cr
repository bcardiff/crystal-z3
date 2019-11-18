class Z3::Ast
  def ==(b : self) : self
    @context.mk_eq(self, b)
  end

  def !=(b : self) : self
    @context.mk_distinct(self, b)
  end

  def <(b : self) : self
    @context.mk_lt(self, b)
  end

  def <=(b : self) : self
    @context.mk_le(self, b)
  end

  def >(b : self) : self
    @context.mk_gt(self, b)
  end

  def >=(b : self) : self
    @context.mk_ge(self, b)
  end
end
