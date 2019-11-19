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

{% for op in %w(== != < <= > >=) %}
  class Z3::Ast
    def {{op.id}}(v : Int) : self
      self.{{op.id}}(@context.mk(v, @context.int_sort))
    end
  end

  struct Int
    def {{op.id}}(b : Z3::Ast) : Z3::Ast
      @context.mk(self, @context.int_sort).{{op.id}}(b)
    end
  end
{% end %}
