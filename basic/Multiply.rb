class Multiply < Struct.new(:left, :right)
  def reducible?
    true
  end

  def reduce
    if left.reducible?
      Add.new(left.reduce, right)
    elsif right.reducible?
      Add.new(left, right.reduce)
    else
      Number.new(left.value * right.value)
    end
  end

  def to_s
    "#{left} * #{right}"
  end

  def inspect
    "-#{self}-"
  end
end
