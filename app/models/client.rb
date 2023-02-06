class Client < User
  has_many :addresses, dependent: :destroy
end