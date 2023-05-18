require 'date'
# Define a class Meetup with a constructor taking a month and a year

class Meetup
  WEEKDAY_ORDER = { 'sunday' => 0, 'monday' => 1, 'tuesday' => 2,
                    'wednesday' => 3, 'thursday' => 4, 'friday' => 5,
                    'saturday' => 6 }

  def initialize(year, month)
    @date = Date.new(year, month)
  end

  def day(weekday, schedule)
    target_day = WEEKDAY_ORDER[weekday.downcase]
    case schedule.downcase
    when 'first'  then first_weekday_from_date(target_day, 1)
    when 'second' then nth_weekday(target_day, 2)
    when 'third'  then nth_weekday(target_day, 3)
    when 'fourth' then nth_weekday(target_day, 4)
    when 'fifth'  then fifth_weekday(target_day)
    when 'last'   then last_weekday(target_day)
    when 'teenth' then first_weekday_from_date(target_day, 13)
    end
  end

  def first_weekday_from_date(target_day, day_of_month)
    start_date = @date + day_of_month - 1
    difference = target_day - start_date.wday
    difference += 7 if difference < 0
    start_date + difference
  end

  def nth_weekday(target_day, n)
    first = first_weekday_from_date(target_day, 1)
    first + (7 * (n - 1))
  end

  def fifth_weekday(target_day)
    potential_date = nth_weekday(target_day, 5)
    potential_date.mon == @date.mon ? potential_date : nil
  end

  def last_weekday(target_day)
    fifth_weekday(target_day) || nth_weekday(target_day, 4)
  end
end
