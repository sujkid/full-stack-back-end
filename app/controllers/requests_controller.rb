class RequestsController < ApplicationController
  def request_user_item
    new_request = Request.create(request_new)
    render json: new_request
  end

  private

  def request_new
    params.require(:request)
          .permit(:borrowed_user_item_id, :lent_user_item_id,
                  :location, :duration)
  end
end
