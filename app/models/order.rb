class Order < ApplicationRecord
  belongs_to :coupon, optional: true
  belongs_to :user
  belongs_to :address

  enum status: { pending: 'pending', confirmed: 'confirmed', delivered: 'delivered', canceled: 'canceled' }, _default: 'pending'
  validates :status, inclusion: { in: statuses.keys }
end
