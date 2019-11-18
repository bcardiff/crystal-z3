@[Link("z3")]
lib LibZ3
  alias String = UInt8*
  type Config = Void*
  type Context = Void*
  type Solver = Void*
  type Sort = Void*
  type Symbol = Void*
  type Ast = Void*
  type Model = Void*

  enum LBool
    False = -1
    Undef
    True
  end

  fun mk_config = Z3_mk_config : Config
  fun del_config = Z3_del_config(c : Config) : Void
  fun set_param_value = Z3_set_param_value(c : Config, param_id : String, param_value : String) : Void

  fun mk_context = Z3_mk_context(c : Config) : Context
  fun del_context = Z3_del_context(c : Context) : Void

  fun mk_solver = Z3_mk_solver(c : Context) : Solver
  fun solver_inc_ref = Z3_solver_inc_ref(c : Context, s : Solver) : Void
  fun solver_dec_ref = Z3_solver_dec_ref(c : Context, s : Solver) : Void

  fun mk_bool_sort = Z3_mk_bool_sort(c : Context) : Sort
  fun mk_int_sort = Z3_mk_int_sort(c : Context) : Sort
  fun mk_real_sort = Z3_mk_real_sort(c : Context) : Sort
  fun mk_bv_sort = Z3_mk_bv_sort(c : Context, sz : UInt32) : Sort

  # Z3_ast Z3_API Z3_mk_true(Z3_context c);
  # Z3_ast Z3_API Z3_mk_false(Z3_context c);

  fun mk_string_symbol = Z3_mk_string_symbol(c : Context, s : String) : Symbol
  fun mk_int_symbol = Z3_mk_int_symbol(c : Context, i : Int32) : Symbol

  fun mk_numeral = Z3_mk_numeral(c : Context, numeral : String, ty : Sort) : Ast
  fun mk_real = Z3_mk_real(c : Context, num : Int32, den : Int32) : Ast
  fun mk_int = Z3_mk_int(c : Context, v : Int32, ty : Sort) : Ast
  fun mk_unsigned_int = Z3_mk_unsigned_int(c : Context, v : UInt32, ty : Sort) : Ast
  fun mk_int64 = Z3_mk_int64(c : Context, v : Int64, ty : Sort) : Ast
  fun mk_unsigned_int64 = Z3_mk_unsigned_int64(c : Context, v : UInt64, ty : Sort) : Ast

  fun mk_const = Z3_mk_const(c : Context, s : Symbol, ty : Sort) : Ast
  fun inc_ref = Z3_inc_ref(c : Context, a : Ast) : Void
  fun dec_ref = Z3_dec_ref(c : Context, a : Ast) : Void

  fun mk_xor = Z3_mk_xor(c : Context, t1 : Ast, t2 : Ast) : Ast
  fun mk_or = Z3_mk_or(c : Context, num_args : UInt32, args : Ast*) : Ast
  fun mk_and = Z3_mk_and(c : Context, num_args : UInt32, args : Ast*) : Ast
  fun mk_implies = Z3_mk_implies(c : Context, t1 : Ast, t2 : Ast) : Ast
  # Z3_ast Z3_API Z3_mk_ite(Z3_context c, Z3_ast t1, Z3_ast t2, Z3_ast t3);
  # Z3_ast Z3_API Z3_mk_iff(Z3_context c, Z3_ast t1, Z3_ast t2);

  fun mk_add = Z3_mk_add(c : Context, num_args : UInt32, args : Ast*) : Ast
  fun mk_mul = Z3_mk_mul(c : Context, num_args : UInt32, args : Ast*) : Ast
  fun mk_sub = Z3_mk_sub(c : Context, num_args : UInt32, args : Ast*) : Ast
  # Z3_ast Z3_API Z3_mk_unary_minus(Z3_context c, Z3_ast arg);
  # Z3_ast Z3_API Z3_mk_div(Z3_context c, Z3_ast arg1, Z3_ast arg2);
  # Z3_ast Z3_API Z3_mk_mod(Z3_context c, Z3_ast arg1, Z3_ast arg2);
  # Z3_ast Z3_API Z3_mk_rem(Z3_context c, Z3_ast arg1, Z3_ast arg2);
  # Z3_ast Z3_API Z3_mk_power(Z3_context c, Z3_ast arg1, Z3_ast arg2);

  fun mk_eq = Z3_mk_eq(c : Context, t1 : Ast, t2 : Ast) : Ast
  fun mk_distinct = Z3_mk_distinct(c : Context, num_args : UInt32, args : Ast*) : Ast
  fun mk_lt = Z3_mk_lt(c : Context, t1 : Ast, t2 : Ast) : Ast
  fun mk_le = Z3_mk_le(c : Context, t1 : Ast, t2 : Ast) : Ast
  fun mk_gt = Z3_mk_gt(c : Context, t1 : Ast, t2 : Ast) : Ast
  fun mk_ge = Z3_mk_ge(c : Context, t1 : Ast, t2 : Ast) : Ast
  # Z3_ast Z3_API Z3_mk_divides(Z3_context c, Z3_ast t1, Z3_ast t2);

  # Z3_ast Z3_API Z3_mk_int2real(Z3_context c, Z3_ast t1);
  # Z3_ast Z3_API Z3_mk_real2int(Z3_context c, Z3_ast t1);
  # Z3_ast Z3_API Z3_mk_is_int(Z3_context c, Z3_ast t1);

  fun ast_to_string = Z3_ast_to_string(c : Context, a : Ast) : String

  fun solver_assert = Z3_solver_assert(c : Context, s : Solver, a : Ast) : Void

  fun solver_check = Z3_solver_check(c : Context, s : Solver) : LBool

  fun solver_get_model = Z3_solver_get_model(c : Context, s : Solver) : Model
  fun model_inc_ref = Z3_model_inc_ref(c : Context, m : Model) : Void
  fun model_dec_ref = Z3_model_dec_ref(c : Context, m : Model) : Void
  fun model_to_string = Z3_model_to_string(c : Context, m : Model) : String

  fun model_eval = Z3_model_eval(c : Context, m : Model, t : Ast, model_completion : Bool, v : Ast*) : Bool
end
