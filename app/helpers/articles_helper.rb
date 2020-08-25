module ArticlesHelper
  def display_author_name(article)
    name_span = ''
    name_span = "<small>Written by: <em>#{article.user.username}</em></small>" if user_signed_in?
    name_span.html_safe
  end
end
