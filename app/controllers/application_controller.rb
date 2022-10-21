class ApplicationController < ActionController::Base
	before_action :init_title

  def init_title
    page = request.controller_class.to_s
    split_page = page.split("::")
    @current_page = split_page[0].gsub("Controller", "").downcase
  end
end
