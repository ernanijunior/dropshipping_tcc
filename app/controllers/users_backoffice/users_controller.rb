class UsersBackoffice::UsersController < UsersBackofficeController
  before_action :verify_password, only: [:update]

  before_action :verify_password, only: [:update]
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(params_user)
    if @users.save
      redirect_to users_backoffice_users_path, notice: "Usuário cadastrado com sucesso!"
    else
      render :new
    end
  end

  def edit
 
  end

  def update    
    if @users.update(params_user)
      redirect_to users_backoffice_users_path, notice: "Usuário atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @users.destroy
      redirect_to users_backoffice_users_path, notice: "Usuário excluído com sucesso!"
    else
      render :index
    end
  end
  private
  
  def params_user
    params.require(:user).permit(:email, :password, :password_confirmation,:name_user, :city_user, :last_name_user, :street_user, :zip_code_user ) 

  end
  
  def set_user
    @users = User.find(params[:id])
  end

  def verify_password
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].extract!(:password, :password_confirmation)
    end
  end
 
end
