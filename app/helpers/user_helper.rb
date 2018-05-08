module UserHelper
  def activate_user user
    if user.activated?
      t("views.admin.users.user.activated")
    else
      t("views.admin.users.user.not_activated")
    end
  end

  def admin_user user
    if user.admin?
      t("views.admin.users.user.admin")
    else
      t("views.admin.users.user.member")
    end
  end
end
