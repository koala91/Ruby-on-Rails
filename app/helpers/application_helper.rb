module ApplicationHelper
  # 辅助方法在help里面？
  def full_title(page_title= '')
    base_title = "Ruby on Rails"
    if base_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
