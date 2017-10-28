class PaypalController < ApplicationController
    protect_from_forgery :except => [:create]
    def verify_payment(event_type, state, total, currency)
        event_type == "PAYMENT.SALE.COMPLETED" &&
        state == "completed" &&
        total == "1.00" &&
        currency == "USD"
    end
    def create
        info = params[:resource]                
        puts verify_payment(params[:event_type], info[:state], info[:amount][:total], info[:amount][:currency])
        p info[:custom]
        head :ok
    end
end