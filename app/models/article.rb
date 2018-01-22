class Article < ApplicationRecord
  validates :title, presence: true
  validates :parameterized, presence: true
  validates :content, presence: true
  validates :markdown, presence: true
  validates :published, presence: true
end
