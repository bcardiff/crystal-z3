class Z3::Ast
  def initialize(@context : Context, @raw : LibZ3::Ast)
    LibZ3.inc_ref(@context, @raw)
  end

  def finalize
    LibZ3.dec_ref(@context, @raw)
  end

  def to_unsafe
    @raw
  end

  def to_s(io : IO)
    io << String.new(LibZ3.ast_to_string(@context, self))
  end

  def ^(b : self) : self
    @context.mk_xor(self, b)
  end
end
