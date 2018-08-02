class StaticPagesController < ApplicationController
	def home
	end

    def secret
  		if !logged_in?
	    	flash[:danger] = "AhAh petit malin! Allez va vite te connecter 😻"
	    	redirect_to '/login'
		end
	end
end
