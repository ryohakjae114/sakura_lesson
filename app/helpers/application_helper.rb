module ApplicationHelper
  def title_dom(title)
    content_tag(:h1, title, class: 'my-5')
  end
end
