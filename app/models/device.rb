class Device < ActiveRecord::Base
  belongs_to :account

  validates :account_id, presence: true
  validates :endpoint, presence: true, uniqueness: { scope: :account_id }
  validates :p256dh, presence: true
  validates :auth, presence: true
end
