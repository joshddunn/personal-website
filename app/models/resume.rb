class Resume < ApplicationRecord
  has_attached_file :pdf, url: "/resume/:id/:filename"
  validates_attachment_content_type :pdf, content_type: /application\/pdf/

  belongs_to :user
end
