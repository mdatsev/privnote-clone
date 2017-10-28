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
        uid = info[:custom].to_i
        user = User.find(uid)
        user.pro = true
        user.save
        head :ok
    end
end
