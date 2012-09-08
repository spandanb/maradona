class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
		# Returns the currently logged in user or nil if there isn't one
		def current_user
			return unless session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id])
		end
		
#		def show_user
#			return unless session[:user_id]
#			@show_user ||= User.find(params[:id])
#		end
#		helper_method :show_user


		# Make current_user available in templates as a helper
		helper_method :current_user
		
		# Filter method to enforce a login requirement		
		# Apply as a before_filter on any controller you want to protect
		def authenticate
			logged_in? ? true : access_denied
		end
		
		# Predicate method to test for a logged in user
		def logged_in?
			current_user.is_a? User
		end
		
		# Make logged_in? available in templates as a helper
		helper_method :logged_in?
		
		def access_denied
			redirect_to login_path, :notice => "Please log in to continue" and return false
		end


		  def store_location
		    session['saved_location'] = request.request_uri
		  end

		  def previous_url
		    if session['saved_location'].nil?
			@previous_url ||= nil 
		    else
			@previous_url ||= session['return-to']
		    end
		  end
		helper_method :previous_url



end
