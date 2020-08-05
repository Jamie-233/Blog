module ApplicationHelper
  def full_title(page_title = '')
    base_title = '简存 - 创作我的创作'
    simple_title = '简存'
    if page_title.empty?
      base_title
    else
      page_title + " - " + simple_title
    end
  end
end
