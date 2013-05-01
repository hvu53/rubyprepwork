def measure count =1
  total = 0
  count.times do
    start_time = Time.now
    yield

    end_time = Time.now
    total += end_time - start_time
  end
  total / count
end