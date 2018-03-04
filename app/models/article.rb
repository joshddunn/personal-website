class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :parameterized, presence: true, uniqueness: true
  validates :content, presence: true
  validates :markdown, presence: true
  validates :published, presence: true

  has_many :screenshots, dependent: :destroy
end
