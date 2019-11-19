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

{% for op in %w(+ * -) %}
  class Z3::Ast
    def {{op.id}}(v : Int) : self
      self.{{op.id}}(@context.mk(v, @context.int_sort))
    end
  end

  struct Int
    def {{op.id}}(b : Z3::Ast) : Z3::Ast
      b.context.mk(self, b.context.int_sort).{{op.id}}(b)
    end
  end
{% end %}
