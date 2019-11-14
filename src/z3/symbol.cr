class Z3::Symbol
  private def initialize(@raw : LibZ3::Symbol)
  end

  def to_unsafe
    @raw
  end

  def self.from_int(c : Context, i : Int32)
    LibZ3.mk_int_symbol(c, i)
  end
end

# void display_symbol(Z3_context c, FILE * out, Z3_symbol s)
# {
#     switch (Z3_get_symbol_kind(c, s)) {
#     case Z3_INT_SYMBOL:
#         fprintf(out, "#%d", Z3_get_symbol_int(c, s));
#         break;
#     case Z3_STRING_SYMBOL:
#         fprintf(out, "%s", Z3_get_symbol_string(c, s));
#         break;
#     default:
#         unreachable();
#     }
# }
