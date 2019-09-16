class Student
  attr_reader :name, :age, :scores

  def initialize(details)
    @name = details[:name]
    @age = details[:age]
    @scores = []
  end

  def log_score(score)
    @scores.push(score)
  end

  def grade
    @scores.sum / @scores.length.to_f
  end

end
