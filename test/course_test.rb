require 'minitest/autorun'
require 'minitest/pride'
require './lib/student'
require './lib/course'

class CourseTest < Minitest::Test

  def setup
    @course = Course.new("Calculus", 2)

    @morgan = Student.new({name: "Morgan", age: 21})
    @jordan = Student.new({name: "Jordan", age: 29})
  end

  def test_it_exists
    assert_instance_of Course, @course
  end

  def test_initialize
    assert_equal 'Calculus', @course.name
    assert_equal 2, @course.capacity
    assert_equal [], @course.students
  end

  def test_enroll
    @course.enroll(@morgan)
    assert_equal [@morgan], @course.students

    @course.enroll(@jordan)
    assert_equal [@morgan, @jordan], @course.students
  end

  def test_full?
    assert_equal false, @course.full?

    @course.enroll(@morgan)
    assert_equal false, @course.full?

    @course.enroll(@jordan)
    assert_equal true, @course.full?
  end

end
