class HomeController < ApplicationController

    def myprod
        @products = Product.where(user_id: current_user.id)
    end

    def claim
        @products = Product.where(claimed_by: current_user.id)
    end

end
