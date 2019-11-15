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

  fun mk_string_symbol = Z3_mk_string_symbol(c : Context, s : UInt8*) : Symbol

  fun mk_const = Z3_mk_const(c : Context, s : Symbol, ty : Sort) : Ast
  fun inc_ref = Z3_inc_ref(c : Context, a : Ast) : Void
  fun dec_ref = Z3_dec_ref(c : Context, a : Ast) : Void

  fun mk_xor = Z3_mk_xor(c : Context, t1 : Ast, t2 : Ast) : Ast
  fun mk_or = Z3_mk_or(c : Context, num_args : UInt32, args : Ast*) : Ast
  fun mk_eq = Z3_mk_eq(c : Context, l : Ast, r : Ast) : Ast
  fun mk_distinct = Z3_mk_distinct(c : Context, num_args : UInt32, args : Ast*) : Ast

  fun ast_to_string = Z3_ast_to_string(c : Context, a : Ast) : String

  fun solver_assert = Z3_solver_assert(c : Context, s : Solver, a : Ast) : Void

  fun solver_check = Z3_solver_check(c : Context, s : Solver) : LBool

  fun solver_get_model = Z3_solver_get_model(c : Context, s : Solver) : Model
  fun model_inc_ref = Z3_model_inc_ref(c : Context, m : Model) : Void
  fun model_dec_ref = Z3_model_dec_ref(c : Context, m : Model) : Void
  fun model_to_string = Z3_model_to_string(c : Context, m : Model) : String

  fun model_eval = Z3_model_eval(c : Context, m : Model, t : Ast, model_completion : Bool, v : Ast*) : Bool

  # fun mk_int_symbol = Z3_mk_int_symbol(c : Context, i : LibC::Int) : Symbol

  #   Z3_ast mk_var(Z3_context ctx, const char * name, Z3_sort ty)
  # {
  #     Z3_symbol   s  = Z3_mk_string_symbol(ctx, name);
  #     return Z3_mk_const(ctx, s, ty);

  # Z3_mk_bool_sort

  # Z3_ast mk_int(Z3_context ctx, int v)
  # {
  #     Z3_sort ty = Z3_mk_int_sort(ctx);
  #     return Z3_mk_int(ctx, v, ty);
  # }

  # /**
  #    \brief Create a real variable using the given name.
  # */
  # Z3_ast mk_real_var(Z3_context ctx, const char * name)
  # {
  #     Z3_sort ty = Z3_mk_real_sort(ctx);
  #     return mk_var(ctx, name, ty);
  # }

end
