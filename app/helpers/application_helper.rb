module ApplicationHelper
  def admin_title_text(title)
    "#{Admin.model_name.human}#{title}"
  end
end
