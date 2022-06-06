# ./lib/user.rb

require 'date'

class User
  attr_reader :name, :message
  
  def initialize(name, day, month)
    @name = name
    @day = day.to_i
    @month = month.to_i
    @today = DateTime.new(Time.now.year, Time.now.month, Time.now.day)
  end

  def generate_message
    compare_date
    if @difference == 0
      @message = "Happy Birthday #{@name}!"
    else
      @message = "Your birthday will be in #{@difference} days, #{name}!"
    end
  end

  private

  def compare_date
    birthday_this_year = DateTime.new(Time.now.year, @day, @month)
    birthday_next_year = DateTime.new(Time.now.year + 1, @day, @month)

    if birthday_this_year - @today >= 0
      @difference = birthday_this_year - @today
    else
      @difference = birthday_next_year - @today
    end
    @difference = @difference.to_i
  end

end
