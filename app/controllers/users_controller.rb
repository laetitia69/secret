class UsersController < ApplicationController


	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)


		if @user.save
			log_in @user
			remember @user
			flash.now[:success] = "Sois le bienvenue à bord, Moussaillon!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		if logged_in? && (current_user.id == params[:id].to_i)
			@user = User.find(params[:id])
		else
			flash.now[:danger] = "AhAh petit malin je t'ai coincé! Va te connecter et plus vite que ça moussaillon!"
			redirect_to '/'
		end
	end

	def show
		set_user
	end

	def update
		if @user.update(user_params)
			flash.now[:success] = "Tes modifications ont été prises en compte, Moussaillon!"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		# @user.destroy
		# flash.now[:success] = "Oh non on vient de perdre un moussaillon!"
		# redirect_to users_url

	end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end
end
