module ResumeHelper
  def resume?
    return Resume.all.present? 
  end

  def resume_id
    return Resume.first.id 
  end

  def resume_link
    return Resume.first.pdf.url 
  end
end
