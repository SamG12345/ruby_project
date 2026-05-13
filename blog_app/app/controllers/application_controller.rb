class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  ##### Danger code
  # Bypasses the Origin check explicitly for local/Codespaces testing
  skip_before_action :verify_authenticity_token, if: -> { Rails.env.development? }
  #####
  #####

end
