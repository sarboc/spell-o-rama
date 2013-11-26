class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
    render text: 'loading...', layout: true
  end
end
