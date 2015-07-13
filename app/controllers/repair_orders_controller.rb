class RepairOrdersController < ApplicationController
# This retrieves all repair orders in existance.
  def repair_orders_index
    @repair_orders_index = RepairOrder.all
    render json: { repair_orders: @repair_orders_index.as_json },
     status: :ok
  end

# This retrieves all repair orders for the current business user.
  def business_repair_orders_index
    @business_repair_orders = current_business_user.repair_orders.all
    if @business_repair_orders
    render json: { repair_orders: @business_repair_orders.as_json },
     status: :ok
   else
     render json: { repair_orders: @business_repair_orders.error.full_messages },
     status: :unprocessable_entity
   end
  end

# This retrieves all repair orders for the current employee user.
  def employee_repair_orders_index
    @employee_repair_orders = current_employee_user.repair_orders.all
    if @employee_repair_orders
    render json: { repair_orders: @employee_repair_orders.as_json },
     status: :ok
   else
     render json: { repair_orders: @employee_repair_orders.error.full_messages },
     status: :unprocessable_entity
   end
  end

# This will be used in the creation of a RO Number page.
  def repair_order_create
    @repair_order = current_business_user.repair_orders.new(repair_order_number: params[:repair_order_number])
    if @repair_order.save
      render json: { repair_order: @repair_order.as_json },
      status: :created
    else
      render json: { errors: @repair_order.errors.full_messages },
      status: :unprocessable_entity
    end
  end

# This will attach employee to RO after the RO has been created.
  def repair_order_employees_create
    @vehicle = @client.vehicles.create
    @repair_order = Repair_orders.find(params[:repair_order_id])
    @repair_order_employee = @repair_order.employee_users_repair_orders.new(params[:employee_number])
    if @repair_order_employee.save
      render json: {repair_order_employee: @repair_order_employee.as_json(include:[:employee_user, :client, :vehicle])},
      status: :created
    else
      render json: { errors: @repair_order_employee.errors.full_messages },
      status: :unprocessable_entity
    end
  end

# This will remove employee from repair order.
  def repair_order_employees_delete
    @repair_order = current_business_user.repair_orders.find(params[:id])
    @repair_order_employee = current_business_user.employee_users.where(
                                                :id => params[:employee_number])
    @repair_order.employee_users.delete
    if @repair_order.employee_users.save
      render json: { repair_order_employees: @repair_order_employee.as_json },
      status: :ok
    else
      render json: { errors: @repair_order_employee.errors.full_messages },
      status: :unprocessable_entity
    end
  end

# Displays repair order, client info, and vehicle info.
  def repair_order_show
    @repair_order = current_business_user.repair_orders.find(params[:id])

    if @repair_order.save
     render json: { repair_order: @repair_order.as_json(:include [:employee_user, :client, :vehicle])},

         status: :ok
     else
       render json: { errors: @repair_order.errors.full_messages },
         status: :not_found
     end
  end


  def repair_order_update

  end

  def repair_order_destroy
  end

end
