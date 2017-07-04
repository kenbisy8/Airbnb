class Order < ApplicationRecord

  belongs_to :user
  belongs_to :room

  validates :persons, :check_in, :check_out, :messages, presence: true
  validates :confirmation, acceptance: true

end
