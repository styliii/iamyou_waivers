module WaiversHelper
  def signature_tag(waiver)
    "<img src='#{waiver.png}'>".html_safe
  end

end
