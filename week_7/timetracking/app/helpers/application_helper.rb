module ApplicationHelper
  def formatted_date(date)
    date.strftime("%d %b %Y")
  end

  def flash_message
    messages = flash.map do |type, message|
      content_tag :div, class: "flash #{type}" do
        message
      end
    end

    messages.join("\n").html_safe
  end
end
