class PublicIcal::Date < SimpleDelegator

  MONTHS = %w[jan feb mrt apr mei jun jul aug sep okt nov dec]

  def date
    case self
    when ''
      nil
    when 'vandaag'
      ::Date.today
    when 'morgen'
      ::Date.tomorrow
    else
      ::Date.new(year, month, day)
    end
  end

  private

  def year
    Date.today.year + (month < Date.today.month ? 1 : 0)
  end

  def month_index
    MONTHS.index(month_text).tap do |index|
      raise "month #{month_text} not valid" unless index
    end
  end

  def month
    month_index + 1
  end

  def month_text
    self[/[a-z]+/]
  end

  def day
    self[/\d+/].to_i
  end

end
