class PersonController < ApplicationController
  before_action :user_signed_in?
    helper_method :current_user
    helper_method :user_signed_in?
  
  def new
	@organization_id = params[:id]
	@person = Person.new
  end

  def store
	@person = Person.new(person_params)
        if @person.save
           
            redirect_to organization_index_path, notice: "Berhasil menambahkan data!"
        else

            render :new, alert: "Gagal menambahkan data!"
        end
  	end
  	def create
        
	end
  	
	def delete
        @ambil_id = Person.find(params[:id])

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
    def person_params
        params.require(:person).permit(:organization_id, :name, :phone, :email, :avatar)
    end
end
