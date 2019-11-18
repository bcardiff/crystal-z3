class Z3::Context
  getter(bool_sort) { Sort.new(self, LibZ3.mk_bool_sort(self)) }
  getter(int_sort) { Sort.new(self, LibZ3.mk_int_sort(self)) }
  getter(real_sort) { Sort.new(self, LibZ3.mk_real_sort(self)) }

  @bit_vector_sorts : Hash(Int32, Sort)?

  def bit_vector_sort(size : Int32) : Sort
    @bit_vector_sorts ||= Hash(Int32, Sort).new
    res = @bit_vector_sorts[size]?

    if res.nil?
      res = Sort.new(self, LibZ3.Z3_mk_bv_sort(self, size.to_u32))
      @bit_vector_sorts[size] = res
    end

    res
  end
end
