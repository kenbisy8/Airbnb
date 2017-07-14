class Diary < ApplicationRecord

  mount_uploader :article_image, ArticleImageUploader

  belongs_to :article_user, class_name: "User"

  validates :article, :article_title, :nation_name, :city_name, presence: true

  scope :search, -> (q){ where("(nation_name LIKE(?) or city_name LIKE(?)) and publicity = false", "%#{q}%", "%#{q}%").limit(5) }
end
