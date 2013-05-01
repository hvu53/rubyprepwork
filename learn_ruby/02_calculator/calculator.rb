def add(a,b)
  a +b
end

def subtract (a,b)
  a-b
end

def sum(n)
  n.inject(0) {|total,n| total + n}
end

def multiply(n)
  n.inject(1) {|product,n| product *n }
end

def power(x,y)
  x**y
end

def factorial(x)
  if x <=1
    1
  else
    x* factorial(x-1)
  end
end