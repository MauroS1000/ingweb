class ApplicationController < ActionController::Base
  # Requiere que todos los usuarios estén autenticados por defecto.
  before_action :authenticate_user!

  # Redirige a la página de inicio de sesión si el usuario no está autenticado.
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  # Redirige a una página específica después del inicio de sesión.
  # Cambia esto para redirigir a la página deseada después de iniciar sesión.
  def after_sign_in_path_for(resource)
    users_path # O cualquier otra ruta que desees como el dashboard.
  end
end
