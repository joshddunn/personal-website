# resume model
class Resume < ApplicationRecord
  has_attached_file :pdf, url: '/resume/:filename'
  validates_attachment_content_type :pdf, content_type: %r{application\/pdf}

  validates :pdf, presence: true

  belongs_to :user
end
