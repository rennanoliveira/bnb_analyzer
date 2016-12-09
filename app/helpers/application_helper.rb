module ApplicationHelper

  def safe_p(field)
    field || 'N/A'
  end

  def safe_l(date)
    date.present? ? date : 'N/A'
  end

  def format_number(number)
    number_with_delimiter(number, delimiter: '.')
  end

  def perc_calc(value1, value2)
    value1/value2.to_f * 100
  end
end
