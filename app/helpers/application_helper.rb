module ApplicationHelper
  def full_title page_title
    base_title = "Trung tâm gia sư"
    page_title.blank? ? base_title : page_title
  end
end
