module UniversesHelper
  def nav_menu(&block)
    content_tag :div, :class=>"center-block navbar-collapse collapse navbar-responsive-collapse", :style=>"text-align: center;" do
      if block_given?
        capture(&block)
      end
    end #div
  end

  def notice 
    html_out = ''
    flash.each do |type, message|
      html_out += content_tag :div, message, :class=>"alert #{bootstrap_class_for(type)} fade in"
    end
    return html_out.html_safe
  end #notice 

  def bootstrap_class_for(flash_type)
    case flash_type
      when :success
        "alert-success"
      when :error
        "alert-danger"
      when :alert
        "alert-warning"
      when :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
