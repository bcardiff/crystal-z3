class Z3::Sort
  def initialize(@context : Context, @raw : LibZ3::Sort)
    # - \c Z3_sort, \c Z3_func_decl, \c Z3_app, \c Z3_pattern are \c Z3_ast's.
    LibZ3.inc_ref(@context, @raw.as(LibZ3::Ast))
  end

  def finalize
    LibZ3.dec_ref(@context, @raw.as(LibZ3::Ast))
  end

  def to_unsafe
    @raw
  end
end
