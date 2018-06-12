# resume helper
module ResumeHelper
  def resume?
    Resume.all.present?
  end

  def resume_id
    Resume.first.id
  end

  def resume_link
    Resume.first.pdf.url
  end
end
