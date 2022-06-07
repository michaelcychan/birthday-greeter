# ./lib/user.rb

require 'date'

class User
  attr_reader :name, :message
  
  def initialize(name, day, month)
    @name = name
    @day = day.to_i
    @month = month.to_i
  end

  def generate_message
    # setting  "today" a fixed date for testing purpose
    if ENV['ENVIRONMENT'] == 'test'
      today = DateTime.new(2022, 6, 6)
    else
      today = DateTime.new(Time.now.year, Time.now.month, Time.now.day)
    end
    
    compare_date(today)
    if @difference == 0
      @message = "Happy Birthday #{@name}!"
    else
      @message = "Your birthday will be in #{@difference} days, #{name}!"
    end
  end

  private

  def compare_date(one_date)
    birthday_this_year = DateTime.new(Time.now.year, @day, @month)
    birthday_next_year = DateTime.new(Time.now.year + 1, @day, @month)

    if birthday_this_year - one_date >= 0
      @difference = birthday_this_year - one_date
    else
      @difference = birthday_next_year - one_date
    end
    @difference = @difference.to_i
  end

end
