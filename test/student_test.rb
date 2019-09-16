require 'minitest/autorun'
require 'minitest/pride'
require './lib/student'

class StudentTest < Minitest::Test

  def setup
    @morgan = Student.new({name: "Morgan", age: 21})
  end

  def test_it_exists
    assert_instance_of Student, @morgan
  end

  def test_initialize
    assert_equal 'Morgan', @morgan.name
    assert_equal 21, @morgan.age
    assert_equal [], @morgan.scores
  end

  def test_log_score
    @morgan.log_score(89)
    assert_equal [89], @morgan.scores

    @morgan.log_score(78)
    assert_equal [89, 78], @morgan.scores
  end

  def test_grade
    @morgan.log_score(89)
    @morgan.log_score(78)
    
    assert_equal 83.5, @morgan.grade
  end

end
