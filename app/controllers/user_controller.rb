class UserController < ApplicationController
    before_action :user_signed_in?
    helper_method :current_user
    helper_method :user_signed_in?


    def index

    end

    def new
        @user = User.new
    end
   
    def store
        
    end

    def create
        @user = User.new(user_params)

        if @user.save

            redirect_to user_index_path, notice: 'Task berhasil ditambahkan'
        else

            render :new
        end
    end

    def edit
        @ambil_id = User.find(params[:id])
    end
    
    def update
        @ambil_id = User.find(params[:id])

        if @ambil_id.update(user_params)
            
            redirect_to user_index_path, notice: 'Task berhasil diupdate'
        else

            render :edit
        end
    end

    def get_user
        render json: { data: User.all() }
    end

    private
    def user_params
        params.require(:user).permit(:name, :phone, :email, :password)
    end
end
