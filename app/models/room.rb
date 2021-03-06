class Room < ApplicationRecord
  has_many :orders
  belongs_to :user

  mount_uploader :image, ImageUploader

  validates :room_name, :country, :prefecture, :address, :image, presence: true
  validates :guest, :bed, numericality: { only_integer: true, less_than_or_equal_to: 99 }, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 1, less_than: 999999 }, presence: true
  validates :room_type, inclusion: ['まるまる貸切', '個室', 'シェアルーム']

end
