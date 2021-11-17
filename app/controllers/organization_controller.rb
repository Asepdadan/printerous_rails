class OrganizationController < ApplicationController
    before_action :user_signed_in?
    helper_method :current_user
    helper_method :user_signed_in?

    layout 'application'

    def index
        # @organization = Organization.includes(:person).all
    end
    
    def new
        @organization = Organization.new
    end

    def create
        @organization = Organization.new(organization_params)
        if @organization.save
           
            redirect_to organization_index_path, notice: "Berhasil menambahkan data!"
        else

            render :new, alert: "Gagal menambahkan data!"
        end
    end


    def get_dataset
        render json: { data: Organization.all().as_json(:include => {
            :person => {:only => [
                :id, :name, :organization_id, :phone, :email, :avatar
            ]}}) 
        }
    end

    def form
        
    end

    def destroy
        @ambil_id = Organization.find(params[:id])

        if @ambil_id.destroy
            respond_to do |format|
				msg = { :error => 0, :message => "Success!" }
				format.json  { render :json => msg } 
			end
        else
            respond_to do |format|
				msg = { :error => 1, :message => "Error!" }
				format.json  { render :json => msg } 
			end
        end
    end

    private
    def organization_params
        params.require(:organization).permit(:name, :phone, :email, :website, :logo)
    end
end
