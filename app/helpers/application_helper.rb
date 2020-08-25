module ApplicationHelper
  def display_user_signup_or_login
    display = ''
    if user_signed_in?
      display = link_to('Logout', destroy_user_session_path, method: :delete, class: 'button is-danger')
    else
      display << link_to('Sign In', new_user_session_path, class: 'button is-info')
      display << link_to('Sign Up', new_user_registration_path, class: 'button is-info mx-2')
    end
    display.html_safe
  end

  def display_create_button
    button_display = ''
    if user_signed_in?
      button_display = link_to('Create post', new_post_path, class: 'button is-info is-inverted is-outlined')
    end
    button_display
  end
end
