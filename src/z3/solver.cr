class Z3::Solver
  getter context : Context

  def initialize(@context = Context.new)
    @raw = LibZ3.mk_solver(@context)
    LibZ3.solver_inc_ref(@context, @raw)
  end

  def finalize
    LibZ3.solver_dec_ref(@context, @raw)
  end

  def to_unsafe
    @raw
  end

  def assert(a : Ast)
    LibZ3.solver_assert(@context, self, a)
  end

  def check : CheckResult
    result = Z3::Result.from_z3_lbool(LibZ3.solver_check(@context, self))
    case result
    when .unsat?
      CheckResult.new(result, nil)
    else
      CheckResult.new(result, solver_get_model)
    end
  end

  private def solver_get_model
    m = LibZ3.solver_get_model(@context, self)

    if m.null?
      nil
    else
      Model.new(@context, m)
    end
  end
end
