# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav pull-right'

    if user_signed_in?
      primary.item :my_profile, 'My Profile', user_path(current_user), icon: 'icon-user'
      primary.item :edit_account, 'Edit Account', edit_user_registration_path, icon: 'icon-edit'
      primary.item :sign_out, 'Sign Out', destroy_user_session_path, icon: 'icon-off', method: :delete
    else 
      primary.item :sign_in, 'Sign In', new_user_session_path, unless: Proc.new { user_signed_in? }
      primary.item :sign_up, 'Sign Up', new_user_registration_path, unless: Proc.new { user_signed_in? }
    end
  end
end
