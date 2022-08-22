class Article < ApplicationRecord
  belongs_to :user

  validates :title, :content, :url, presence: true
  validates :url, format: {with: /\Ahttps:\/\/[a-z0-9]+([-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/}
end
