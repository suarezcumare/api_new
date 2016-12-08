class Users::SessionsController < Devise::SessionsController
  respond_to :json
  
  def new
  	render json: {
                    success: false,
                    info: "Error login",
                  }
  end

  def destroy
    signed_out = sign_out(resource_name)
    render json: {
                    success: true,
                    info: "Logged out",
                  }
	end
 
end
