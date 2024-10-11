module ApplicationHelper
  def admin_title_text(title)
    "#{Admin.model_name.human}#{title}"
  end

  def title_dom(title)
    content_tag(:h1, title, class: 'my-5')
  end
end
