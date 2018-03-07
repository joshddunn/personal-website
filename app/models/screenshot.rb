class Screenshot < ApplicationRecord

  before_validation :generate_hex

  has_attached_file :image, url: "/image/:hex"
  validates_attachment_content_type :image, content_type: /png|jpg/

  validates :image, presence: true
  validates :hex, format: { with: /\A[a-z0-9]+\z/ }, length: { is: 20 }

  belongs_to :article

  private
    
    def generate_hex
      self.hex = SecureRandom.hex(10)
    end

    Paperclip.interpolates :hex do |attachment, style|
      attachment.instance.hex
    end

end
