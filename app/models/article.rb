class Article < ApplicationRecord
  validates :title, :content, :url, presence: true
end
