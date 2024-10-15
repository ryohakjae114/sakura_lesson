module ApplicationHelper
  def title_dom(title)
    content_tag(:h1, title, class: 'my-5')
  end

  def user_confirm_status_badge(user)
    if user.confirmed?
      content_tag(:span, t('admins.users.user_confirmed'),
                  class: 'badge text-bg-success')
    else
      content_tag(:span, t('admins.users.user_unconfirmed'), class: 'badge text-bg-secondary')
    end
  end
end
