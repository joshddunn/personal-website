module ResumeHelper
  def resume?
    return current_user.resume.present? 
  end

  def resume_id
    return current_user.resume.id 
  end

  def resume_link
    return current_user.resume.pdf.url 
  end
end
