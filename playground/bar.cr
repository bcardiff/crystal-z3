require "../src/z3"
include Z3

s = Solver.new
ctx = s.context

x = ctx.mk_int_var("x")
y = ctx.mk_int_var("y")

s.assert(x > 2)        # x > 2
s.assert(y < 10)       # y < 10
s.assert(x + 2*y == 7) # x + 2 * y == 7

puts "1st model"
r = s.check

puts r.sat? # => true
puts r.model
puts r.model.eval(x) # => 7
puts r.model.eval(y) # => 0

s.assert (x != r.model.eval(x)).or(y != r.model.eval(y))

puts "2nd model"
r = s.check

puts r.sat? # => true
puts r.model
puts r.model.eval(x) # => 9
puts r.model.eval(y) # => -1
