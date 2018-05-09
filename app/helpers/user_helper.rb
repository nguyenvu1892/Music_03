module UserHelper
  def activate_user user
    if user.activated?
      t("garena.activated")
    else
      t("garena.not_activated")
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
