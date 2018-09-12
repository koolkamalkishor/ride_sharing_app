class ApplicationController < ActionController::Base
  include Pundit
  def index
    render 'index'
  end
end
