module ApplicationHelper
  def class_for flash_type
    { success: 'is-primary', error: 'is-danger', notice: 'is-warning'}[flash_type.to_sym]
  end

  def flash_messages(flash)
    flash.map do |msg_type, message|
      content_tag(:div, class: "message #{class_for(msg_type)}") do
        content_tag(:div, class: "message-header") do
          (message + content_tag(:button, 'x'.html_safe, class: 'delete')).html_safe
        end
      end
    end.join.html_safe
  end

  def icon(icon_name, text)
    content_tag(:span, class: "icon") do
      fa_icon(icon_name)
    end + "&nbsp;" .html_safe + text
  end    

  def fa_icon
    
  end
end