class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    id = 0
    self.each.with_index do |ele, i|
      id += i.hash * ele.hash
    end 
    id 

  end

end

class String
  def hash
    abc = ('a'..'z').to_a
    id = 0
    self.each_char.with_index do |ele,i|
      id += i.hash * abc.index(ele).hash 
    end 
    id
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    id = 0
    self.each do |k,v|
      id += k.hash * v.hash
    end 
    id
  end
end
