class AnswersController < ApplicationController
  respond_to :json

  def create
    sleep 1
    render :nothing => true
  end

end
