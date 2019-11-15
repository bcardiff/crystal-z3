# A `Context` manages all other Z3 objects, global configuration options, etc.
# Z3Py uses a default global context. For most applications this is sufficient.
# An application may use multiple Z3 contexts. Objects created in one context
# cannot be used in another one. However, several objects may be "translated" from
# one context to another. It is not safe to access Z3 objects from multiple threads.
# The only exception is the method `#interrupt` that can be used to interrupt a long
# computation.
# The initialization method receives global configuration options for the new context.
class Z3::Context
  # https://github.com/angr/angr-z3/blob/6fa85ad65404c0dbc8adf3e120fa076bd5c6d003/src/api/python/z3/z3.py#L163
  def initialize(config = Config.new)
    # conf = Z3_mk_config()
    # for key in kws:
    #     value = kws[key]
    #     Z3_set_param_value(conf, str(key).upper(), _to_param_value(value))
    # prev = None
    # for a in args:
    #     if prev is None:
    #         prev = a
    #     else:
    #         Z3_set_param_value(conf, str(prev), _to_param_value(a))
    #         prev = None
    # self.ctx = Z3_mk_context_rc(conf)
    # self.eh = Z3_set_error_handler(self.ctx, z3_error_handler)
    # Z3_set_ast_print_mode(self.ctx, Z3_PRINT_SMTLIB2_COMPLIANT)
    # Z3_del_config(conf)

    # TODO should use mk_context or mk_context_rc (ref counting)?
    @raw = LibZ3.mk_context(config)
  end

  def finalize
    LibZ3.del_context(@raw)
  end

  def to_unsafe
    @raw
  end

  getter(bool_sort) { Sort.new(self, LibZ3.mk_bool_sort(self)) }

  def mk_bool_var(name : String)
    mk_var(name, self.bool_sort)
  end

  private def mk_var(name : String, ty : Sort)
    s = LibZ3.mk_string_symbol(self, name)
    Ast.new(self, LibZ3.mk_const(self, s, ty))
  end

  def mk_xor(a : Ast, b : Ast)
    # TODO assert a, b should belong to this context
    Ast.new(self, LibZ3.mk_xor(self, a, b))
  end

  def mk_or(a : Ast, b : Ast)
    # TODO assert a, b should belong to this context
    Ast.new(self, LibZ3.mk_or(self, 2, [a.to_unsafe, b.to_unsafe] of LibZ3::Ast))
  end

  def mk_eq(a : Ast, b : Ast)
    # TODO assert a, b should belong to this context
    Ast.new(self, LibZ3.mk_eq(self, a, b))
  end

  def mk_distinct(a : Ast, b : Ast)
    # TODO assert a, b should belong to this context
    Ast.new(self, LibZ3.mk_distinct(self, 2, [a.to_unsafe, b.to_unsafe] of LibZ3::Ast))
  end
end
