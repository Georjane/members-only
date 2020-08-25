module PostsHelper
  def display_author_name(post)
    name_span = ''
    name_span = "<small>Written by: <em>#{post.user.username}</em></small>" if user_signed_in?
    name_span.html_safe
  end
end
