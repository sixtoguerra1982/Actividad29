class SessionsController < ApplicationController
	def destroy
		reset_session
		redirect_to root_path
	end


	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: params[:user][:email])
		if @user.nil?
			redirect_to users_sing_in_path, alert: 'El usuario no existe'
			return
		end
		if @user.password == params[:user][:password_digest]
			session[:user_id] = @user.id
			redirect_to root_path, alert: 'Welcome'
		else
			redirect_to users_sing_in_path, alert: 'El password no es valido'	
		end	
	end

end
