class Order < ApplicationRecord
  belongs_to :coupon, optional: true
  belongs_to :user
  belongs_to :address
end
