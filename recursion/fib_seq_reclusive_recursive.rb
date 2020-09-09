
#  reclusive
def fib(n)
    result = []
    n.times do |i| 
      if i == 0
        result << 0
      elsif i == 1
        result << 1
      else
        result << result[i-2] + result[i-1]
      end
    end
    return result
  end
  
# recursive
  def fibs_rec(n, result=[0,1])
    return 0 if n == 0
    return 1 if n == 1
    result << result[-1] + result[-2]
    print result
    fibs_rec(n-1, result)
  end
  
  fibs_rec 5
  fib 5