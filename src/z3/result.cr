enum Z3::Result
  Unsat
  Undef
  Sat

  def self.from_z3_lbool(result : LibZ3::LBool) : Result
    case result
    when LibZ3::LBool::False
      Z3::Result::Unsat
    when LibZ3::LBool::Undef
      Z3::Result::Undef
    when LibZ3::LBool::True
      Z3::Result::Sat
    else
      raise "unexpected result"
    end
  end
end

struct Z3::CheckResult
  getter result : Result
  getter! model : Model

  def initialize(@result : Result, @model : Model?)
  end

  delegate :unsat?, :undef?, :sat?, to: result
end
