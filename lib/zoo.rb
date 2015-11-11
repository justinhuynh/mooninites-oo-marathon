class Zoo
  attr_reader :name, :opening_date, :closing_date
  attr_accessor :cages, :employees

  def initialize(name, opening_date, closing_date)
    @name = name
    @opening_date = opening_date
    @closing_date = closing_date
    @cages = []
    10.times do
      @cages << Cage.new
    end
    @employees = []
  end

  def season_opening_date
    opening_date
  end

  def season_closing_date
    closing_date
  end

  def add_employee(employee)
    employees << employee
  end

  def open?(date)
    date <= closing_date && date >= opening_date
  end

  def add_animal(animal)
    cages.each do |cage|
      if cage.empty?
        cage.animal = animal
        return
      end
    end
    raise ZooAtCapacity
  end


  def visit
    greeting = ""
    cages.each do |cage|
      if !cage.empty?
        greeting += "#{cage.animal.speak}\n"
      end
    end
    employees.each do |employee|
      greeting += "#{employee.greet}\n"
    end
    greeting
  end
end

class ZooAtCapacity < StandardError
end
