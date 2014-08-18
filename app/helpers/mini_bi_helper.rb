module MiniBiHelper
   # overwriter twitter-bootstrap-rails method
   def menu_group(options={}, &block)
    pull_class = "navbar-#{options[:pull].to_s}" if options[:pull].present?
    class_op = (options[:class].present?)? options[:class] : pull_class
    content_tag(:ul, :class => class_op, &block)
  end

  def drop_down_list(&block)
    content_tag :ul, :class => "sidebar-nav dropdown-menu", :style=>"position: relative;background-color: unset;", &block
  end
  # end overwrite

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

  def domain(label)
    I18n.t ["domain", label.to_s].join('.')
  end
end 
