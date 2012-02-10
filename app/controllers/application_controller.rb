class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :set_layout

  private
  def set_layout
    if request.headers['X-PJAX']
      false
    else
      "application"
    end
  end

  def pjax?
    raise request.headers["X-PJAX"].present?.inspect
  end
end
