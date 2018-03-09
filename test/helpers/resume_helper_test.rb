require 'test_helper'

class ResumeHelperTest < ActionView::TestCase

  test "false if no resume" do
    assert_not resume? 
  end

  test "true if resume" do
    create(:resume)
    assert resume?
  end

  test "returns proper id" do
    @resume = create(:resume)
    assert_equal @resume.id, resume_id
  end

  test "returns link to resume" do
    @resume = create(:resume)
    assert_equal @resume.pdf.url, resume_link
  end

end
