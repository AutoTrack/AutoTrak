class InvoicesController < ApplicationController
# before_action :authenticate_employee_user_with_token!
# before_action :authenticate_business_user_with_token!


    def invoices_all
        @invoice = Invoice.all

            render json: {invoice: @invoice.as_json},
                status: :ok

            # render 'invoices_all.json.jbuilder', status: :ok
    end

    def business_invoices_index
        @invoice = current_business_user.invoices.all
    end

    def invoices_create
        # user = current_business_user
        clients = current_business_user.clients.find_by(params[:id])
        @invoice = clients.invoices.new( invoice_url: params[ :invoice_url ],
                                                                            invoice_status: params[ :invoice_status ],
                                                                            business_user_id: params[:business_user_id],
                                                                            client_id:params[:client_id],
                                                                            vehicle_id: params[:vehicle_id],
                                                                            repair_order_id: params[:repair_order_id] )


        if @invoice.save
            render json: { invoice: @invoice.as_json( only: [ :id, :business_user_id, :repair_order_id,
                                                                                        :client_id, :vehicle_id ] ) },
            status: :created
        end
    end

    def invoice_show
        @invoice = current_business_user.invoices.find(params[ :id ] )
            render json: {invoice: @invoice.as_json },
                status: :ok
    end

    def invoice_update
        @invoice = current_business_user.invoices.find_by(params[:client_id])

        if @invoice.update(invoice_status: params[ :invoice_stauts ] )

            render json: { invoice: @invoice.as_json },
                status: :created
        end

    end

    def invoice_delete
        @invoice = Invoice.find( params[ :id ] )

        if @invoice.destroy
            render json: {message: "Invoice has been deleted"},
                status: :gone
        end
    end
end