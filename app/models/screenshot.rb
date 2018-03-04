class Screenshot < ApplicationRecord
  has_attached_file :image, url: "/image/:id"
  validates_attachment_content_type :image, content_type: /png|jpg/

  belongs_to :article
end
