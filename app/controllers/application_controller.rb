class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :null_session

  #CanCan---------------------------------------------------------------

  #check_authorization

  # Renames curent_user to current_employee_user.
  # alias_method :current_user, :current_employee_user
  # def current_ability
  #   @current_ability ||= Ability.new(current_employee_user)
  # end
  #---------------------------------------------------------------------
  rescue_from ActiveRecord::RecordNotFound do
      render json: { error: "No such item: #{request.path} " },
        status: :not_found
    end

  def current_business_user
    token = request.headers['Access-Token']
    token && BusinessUser.find_by(access_token: token)
  end

  def authenticate_business_user_with_token!
    unless current_business_user
      render json: { message: "Business Access Token Not Found." },
        status: :unauthenticated
    end
  end

  def current_employee_user
    token2 = request.headers['Access-Token2']
    token2 && EmployeeUser.find_by(access_token2: token2)
  end

  def authenticate_employee_user_with_token!
    unless current_employee_user
      render json: { message: "Employee Access Token Not Found." },
        status: :unauthorized
    end
  end

  def current_client
    token3 = request.headers['Access-Token3']
    token3 && Client.find_by(access_token3: token3)
  end

  def authenticate_client_with_token!
    unless current_client
      render json: { message: "Client Access Token Not Found." },
        status: :unauthorized
    end
  end

  def current_vehicle
    token4 = request.headers['Access-Token4']
    token4 && Vehicle.find_by(access_token4: token4)
  end

  def authenticate_vehicle_with_token!
    unless current_vehicle
      render json: { message: "Vehicle Access Token Not Found." },
        status: :unauthorized
    end
  end

  def current_repair_order
    token5 = request.headers['Access-Token5']
    token5 && RepairOrder.find_by(access_token5: token5)
  end

  def authenticate_repair_order_with_token!
    unless current_repair_order
      render json: { message: "Repair Order Access Token Not Found." },
        status: :unauthorized
    end
  end
end
