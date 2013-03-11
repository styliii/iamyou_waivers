module ApplicationHelper
  def tag(name, options = nil, open = false, escape = true)
    "<#{name}#{tag_options(options, escape) if options}#{open ? ">" : " />"}".html_safe
  end

  def safe_helper(content)
    "#{ CGI::unescapeHTML(content) }".html_safe
  end

  def signature_tag(waiver)
    "<img src='#{waiver.png}'>".html_safe
  end
end
