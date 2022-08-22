class Article < ApplicationRecord
  validates :title, :content, :url, presence: true
  validates :url, format: {with: /^(?:https:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$/ }, message: "Format d'URL incorrect"}
end
