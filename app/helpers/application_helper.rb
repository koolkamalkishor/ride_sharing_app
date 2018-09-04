module ApplicationHelper

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def user_logged_in(&block)
    block.call if current_user
  end

  def roles
    {
        'Passanger' => 'editor',
    }
  end
end
