class UsersController < ApplicationController
  def index
    @users = User.all  # Recupera todos los usuarios para la vista index
  end

  def show
    @user = User.find(params[:id])  # Encuentra un usuario específico para la vista show
  end

  def new
    @user = User.new  # Inicializa un nuevo usuario para el formulario
  end

  def create
    @user = User.new(user_params)  # Crea un nuevo usuario con los parámetros permitidos
    if @user.save
      redirect_to users_path, notice: 'Usuario creado exitosamente.'  # Redirige a la lista de usuarios tras la creación
    else
      render :new  # Vuelve a la vista new si hay errores
    end
  end

  def edit
    @user = User.find(params[:id])  # Encuentra un usuario específico para la edición
  end

  def update
    @user = User.find(params[:id])  # Encuentra el usuario a actualizar
    if @user.update(user_params)
      redirect_to users_path, notice: 'Usuario actualizado exitosamente.'  # Redirige a la lista de usuarios tras la actualización
    else
      render :edit  # Vuelve a la vista edit si hay errores
    end
  end

  def destroy
    @user = User.find(params[:id])  # Encuentra el usuario a eliminar
    @user.destroy
    redirect_to users_path, notice: 'Usuario eliminado exitosamente.'  # Redirige a la lista de usuarios tras la eliminación
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)  # Asegúrate de permitir los parámetros necesarios
  end
end
