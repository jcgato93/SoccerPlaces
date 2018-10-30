class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected
  # Verifica si el nivel de acceso de un usuario es normal
  def authenticate_normal!
    redirect_to root_path unless user_signed_in? &&  current_user.is_normal_user?
  end

  # Verifica si el nivel de acceso de un usuario es de administrador
  def authenticate_admin!
    redirect_to root_path unless user_signed_in? &&  current_user.is_admin?
  end

end
