module ApplicationHelper

  def safe_p(field)
    field || 'N/A'
  end
end
