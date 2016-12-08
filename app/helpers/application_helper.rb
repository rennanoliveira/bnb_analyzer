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
end
