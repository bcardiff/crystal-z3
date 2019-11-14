class Z3::Model
  def initialize(@context : Context, @raw : LibZ3::Model)
    LibZ3.model_inc_ref(@context, @raw)
  end

  def finalize
    LibZ3.model_dec_ref(@context, @raw)
  end

  def to_unsafe
    @raw
  end

  def to_s(io : IO)
    io << String.new(LibZ3.model_to_string(@context, self))
  end

  def eval(t : Ast, *, model_completion : Bool = false) : Ast
    res = LibZ3.model_eval(@context, self, t, model_completion, out v)
    raise "fail to eval" unless res

    Ast.new(@context, v)
  end
end
