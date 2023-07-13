module Enumerable

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each
    for el in self
      yield el
    end
  end

  def my_each_with_index
    i = 0
    for el in self
      yield el, i
      i += 1
    end
  end

  def my_select
    results = []

    for el in self
      results.append(el) if yield(el)
    end

    results
  end

  def my_all?
    for el in self
      return false if !yield(el)
    end
    true
  end

  def my_any?
    for el in self
      return true if yield(el)
    end
    false
  end

  def my_none?
    for el in self
      return false if yield(el)
    end
    true
  end

  def my_count
    return length if !block_given?
    count = 0
    for el in self
      count += 1 if yield(el)
    end
    count
  end

  def my_map
    arr = []
    for el in self
      arr.append(yield(el))
    end
    arr
  end

  def my_inject(arg = nil)
    if !block_given? && arg.is_a?(Symbol)
      sum = nil
      for el in self
        sum.nil? ? sum = el : sum = sum.send(arg, el)
      end
    else
      init = 0
      init = arg if arg.is_a?(Integer)

      for el in self
        init = yield(init, el)
      end

      init
    end
  end
end
