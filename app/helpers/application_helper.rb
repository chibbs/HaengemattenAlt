module ApplicationHelper

	# build an empty ajax link, which we can use with jquery.wrap()
	def empty_ajax_link_to(href)
		"<a href='#{href}' data-remote='true'></a>".html_safe
  end
  
  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
end
end
