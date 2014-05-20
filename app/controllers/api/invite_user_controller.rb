class Api::InviteUserController < Api::UsersController

	def create
	    @user_valid = User.find_by(email: params[:email])
	    @user_invite_valid = User.find_by(email: params[:email2])

	    unless @user_valid.nil?#Si el usuario que invita existe
	    	if @user_invite_valid.nil?#y el usuario invitado aun no existe
		      @user = User.new({:email=>params[:email2],
		                        :password=>generate_password,
		                        :token=>create_Token,
		                        :account_id=>@user_valid.id})
		      if @user.save #Si la consulta al guardar no da error lo guarda
		          render :json => @user
		      else
		        #mandar el error de que no existe
		        render :text => "Error al validar", :status => 404
		      end
		  	else
		  		render :text => "El usuario no existe", :status => 404
		  	end
	    end
	end

	private
	def permitted_params
		params.permit(user: [:email,:email2])
	end



end
