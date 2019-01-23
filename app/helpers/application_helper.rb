module ApplicationHelper
  def page_title
    title = "Bentasu"
    title = @page_title + " - " + title if @page_title
    title
  end

  def menu_link_to(text, path)
    link_to_unless_current(text, path) { content_tag(:span, text) }
  end

  def dish_image_tag(dish, options = {})
    if dish.dish_image.present?
      path = dish_path(dish, format: dish.dish_image.extension)
      link_to(image_tag(path, { alt: dish.name }.merge(options)), path)
    else
      ""
    end
  end
end
