class Z3::Context
  def mk_numeral(numeral : String, ty : Sort) : Ast
    wrap_ast LibZ3.mk_numeral(self, numeral, ty)
  end

  def mk_real(num : Int32, den : Int32) : Ast
    wrap_ast LibZ3.mk_real(self, num, den)
  end

  def mk(v : Int32, ty : Sort) : Ast
    wrap_ast LibZ3.mk_int(self, v, ty)
  end

  def mk(v : UInt32, ty : Sort) : Ast
    wrap_ast LibZ3.mk_unsigned_int(self, v, ty)
  end

  def mk(v : Int64, ty : Sort) : Ast
    wrap_ast LibZ3.mk_int64(self, v, ty)
  end

  def mk(v : UInt64, ty : Sort) : Ast
    wrap_ast LibZ3.mk_unsigned_int64(self, v, ty)
  end
end
