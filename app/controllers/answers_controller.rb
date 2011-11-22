class AnswersController < ApplicationController
  respond_to :json

  def create
    sleep 1
    respond_to do |format|
      format.json {
        logger.info "params are #{params.inspect}"
        render :json => params["answer"]
      }
    end
  end

end
