class HomeController < ApplicationController

    before_action :user_signed_in?
    helper_method :current_user
    helper_method :user_signed_in?

    def index
        
    end
end
