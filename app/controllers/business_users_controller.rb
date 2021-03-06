class BusinessUsersController < ApplicationController
  # skip_authorization_check
  def index
    @business_users = BusinessUser.all
      render json: { business_user: @business_users.as_json },
     status: :ok

     # render 'index.json.jbuilder', status: :ok


  end


  def business_register
     passhash = Digest::SHA1.hexdigest(params[:business_user_password])

     @business_user = BusinessUser.new( business_username: params[:business_username ],
                      business_user_name: params[:business_user_name],
                      business_user_password: passhash,
                      business_user_email: params[:business_user_email],
                      business_user_street: params[:business_user_street],
                      business_user_city: params[:business_user_city],
                      business_user_state: params[:business_user_state],
                      business_user_zipcode: params[:business_user_zipcode],
                      business_logo_url: params[:business_logo_url],
                      business_user_cap: params[:business_user_cap],
                      logo_file_name: params[:logo_file_name],
                      logo_content_type: params[:logo_content_type],
                      logo_file_size: params[:logo_file_size])

    if @business_user.save

    #    BusinessUserMailer.new_business_user(@business_user).deliver_now

      render json: { business_user: @business_user.as_json },
        status: :created
      # render 'business_register.json.jbuilder', locals: { business_user: @business_user }, status: :created
    else
      render json: { errors: @business_user.errors.full_messages },
        status: :unprocessable_entity
    end
  end

  def business_login
    passhash = Digest::SHA1.hexdigest(params[:business_user_password])
    @login_business_user = BusinessUser.find_by(business_username: params[:business_username],
                                                business_user_password: passhash)
    if @login_business_user
      render json: { business_user: @login_business_user.as_json },
        status: :ok
      # render 'business_login.json.jbuilder', locals: {business_user: @business_user}, status: :created

    else
      render json: { message: "Invalid Login" },
        status: :unauthenticated
    end
  end

end
