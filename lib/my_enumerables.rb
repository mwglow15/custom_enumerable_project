module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
      yield item
    end
  end

  def my_each_with_index
    index = 0
    for item in self
      yield item, index

      index += 1
    end
  end

  def my_select
    result = []
    for item in self
      if yield item
        result.push(item)
      end
    end
    return result
  end

  def my_all?
    for item in self
      unless yield item
        return false
      end
    end
    return true
  end

  def my_any?
    for item in self
      if yield item
        return true
      end
    end
    return false
  end
  
  def my_none?
    for item in self
      if yield item 
        return false
      end
    end
    return true
  end

  def my_count
    count = 0

    return self.length unless block_given?

    for item in self
      if yield item
        count += 1
      end
    end
    return count
  end

  def my_map
    result = []
    for item in self
      result.push(yield item)
    end

    return result
  end

  def my_inject(initial)
    total = initial

    for item in self
      total = yield total, item
    end
    return total
  end
end