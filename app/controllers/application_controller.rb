class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def set_admin_locale
    I18n.locale = :en
  end
end
