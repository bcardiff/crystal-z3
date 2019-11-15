require "../src/z3"
include Z3

# def iterate_models(solver : Solver)
# end

# cfg = Config.new
# cfg.params["proof"] = "true"

# Find a model for `x xor y`

s = Solver.new
ctx = s.context

# IDEA: type safety dsl?
#
# Z3.build ctx, ->(x : Bool, y : Bool) {
#   x ^ y
# }

x = ctx.mk_bool_var("x")
y = ctx.mk_bool_var("y")

s.assert(x ^ y)

puts "1st model for: x xor y"
r = s.check

puts r.sat? # => true
puts r.model
puts r.model.eval(x) # => true
puts r.model.eval(y) # => false

s.assert (x != r.model.eval(x)).or(y != r.model.eval(y))

puts "2nd model for: x xor y"
r = s.check

puts r.sat? # => true
puts r.model
puts r.model.eval(x) # => false
puts r.model.eval(y) # => true

s.assert (x != r.model.eval(x)).or(y != r.model.eval(y))

puts "3rd model for: x xor y"
r = s.check
puts r.unsat? # => true
