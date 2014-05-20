
class Api::UsersController < ApplicationController
 require 'base64'

  def index

  end

  def show

  end

  def create
    @params = permitted_params[:model]
    @user_valid = User.find_by(email: params[:email])

    #SI EL USUARIO NO EXISTE AGREGO LA CUENTA Y EL USUARIO ASOCIADOS ENTRE SI POR EL ID DE LA CUENTA

    if @user_valid.nil?
      @account = Account.new(:name=>params[:name])
      if @account.valid?
         @account.save #LO GUARDO ACA PARA OBTENER SU ID Y PODER INGRESARSELO AL USUARIO
      end
#NOTA: El metodo save corre el metodo valid? antes de guardar
      @user = User.new({:email      => params[:email],
                        :password   => generate_password,
                        :token      => create_Token,
                        :account_id => @account.id})
        if @user.save #Si la consulta al guardar no da error lo guarda
          render :json => @user

        end
    else #Si el usuario ya existe tira este error
      render :text => "El usuario no existe", :status => 404
    end
  end



  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {}
  end


  private

  def create_Token
    time = Time.now.to_s
  	new_token = Digest::SHA1.hexdigest(params[:email] + time)
  end


  def generate_password
    time = Time.now.to_s
    new_token = Digest::SHA1.hexdigest(params[:email] + time)
  end

  def permitted_params
    params.permit(user: [:email, :password, :token, :name,  :account_id])
  end

end
