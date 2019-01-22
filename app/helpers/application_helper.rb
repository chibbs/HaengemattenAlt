module ApplicationHelper

	# build an empty ajax link, which we can use with jquery.wrap()
	def empty_ajax_link_to(href)
		"<a href='#{href}' data-remote='true'></a>".html_safe
  end
end
