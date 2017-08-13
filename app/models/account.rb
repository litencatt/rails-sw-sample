class Account < ActiveRecord::Base
  has_many :devices, dependent: :destroy
end
