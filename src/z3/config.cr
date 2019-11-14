class Z3::Config
  def initialize
    @raw = LibZ3.mk_config
  end

  def finalize
    LibZ3.del_config(self)
  end

  def to_unsafe
    @raw
  end

  struct Params
    def initialize(@config : Config)
    end

    def []=(param : String, value : String)
      LibZ3.set_param_value(@config, param, value)
    end
  end

  def params
    Params.new(self)
  end
end
