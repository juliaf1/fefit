module Admin
  class CouponsController < Admin::ApplicationController

    def create
      coupon = Coupon.new(coupon_params)
      coupon.user = current_user
      coupon.save
      redirect_to admin_coupon_path(coupon)
    end

    private

    def coupon_params
      params.require(:coupon).permit(:code, :total_uses)
    end

  end
end
