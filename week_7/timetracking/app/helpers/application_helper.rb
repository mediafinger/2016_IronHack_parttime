module ApplicationHelper
  def formatted_date(date)
    date.strftime("%d %b %Y")
  end

  # TODO exercise: refactor method, keep it DRY
  def flash_message
    if flash[:alert]
      content_tag :div, class: "flash alert" do
        flash[:alert]
      end
    elsif flash[:notice]
      content_tag :div, class: "flash notice" do
        flash[:notice]
      end
    end
  end
end
