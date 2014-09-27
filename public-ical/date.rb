class PublicIcal::Date < SimpleDelegator

  MONTHS = %w[jan feb maa apr mei jun jul aug sep okt nov dec]

  def date
    case self
    when ''
      nil
    when 'vandaag'
      ::Date.today
    when 'morgen'
      ::Date.tomorrow
    else
      ::Date.new(Date.today.year, month, day)
    end
  end

  def month
    MONTHS.index(month_text) + 1
  end

  def month_text
    self[/[a-z]+/]
  end

  def day
    self[/\d+/].to_i
  end

end
