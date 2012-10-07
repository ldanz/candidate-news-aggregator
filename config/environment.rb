# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
CandidateNewsAggregator::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  error_html = ''
  if html_tag =~ /controls/
    errors = Array(instance.error_message).join(', ')
    error_html = "<span class=\"help-inline\">#{errors}</span>"
  end
  "<div class=\"field_with_errors\">#{html_tag}#{error_html}</div>".html_safe
end
