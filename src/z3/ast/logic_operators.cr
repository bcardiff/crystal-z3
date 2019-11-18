class Z3::Ast
  # NOTE: Unable to overide || operator in Crystal due to semantics
  def or(b : self) : self
    @context.mk_or(self, b)
  end

  def ^(b : self) : self
    @context.mk_xor(self, b)
  end

  def and(b : self) : self
    @context.mk_and(self, b)
  end

  def implies(b : self) : self
    @context.mk_implies(self, b)
  end
end
