class Api::SurveysController < ApplicationController
  def index
  end
  def show
    @survey = Survey.first
    @survey = @survey.find(params[:id])
  end

  def create
    @params = permitted_params[:survey]
    #@survey = Survey.find_by(name: params[:name])

    @user_exist = User.find_by(email: params[:email])
    #busco si existe la cuenta para poder agregar la encuesta

    	unless @user_exist.nil? #si la cuenta existe entonces si agrega la encuesta
    	 @survey = Survey.new({
  					:name => params[:name],
  					:account_id => @user_exist.account_id
				   })
    	 if @survey.valid?
    		if @survey.save
    			render :json => @survey
    		end
    	else #Si el usuario ya existe tira este error
    		@survey = @survey.valid?
     		render :text => "Error al validar", :status => 404
   		end
    else
      render :text => "El usuario no existe", :status => 404
   		 #SI LA ENCUESTA EXISTE POR EL NOMBRE DA ERROR 400 YA QUE EXISTE
   	 	#SI LA ENCUESTA NO EXISTE POR EL NOMBRE ENTONCES LA AGREGA
     end
  end


  def destroy
    @user = Survey.first
    user = @user.find(params[:id])
    user.destroy
    render json: {}
  end

  def permitted_params
    params.permit(survey: [:email, :name])
  end
end