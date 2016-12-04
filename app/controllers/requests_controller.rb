class RequestsController < ApplicationController
  # POST
  # requesting a user_item
  def request_user_item
    @request_user_item = Request.create(request_user_item_param)
    if @request_user_item.save
      @user_item = UserItem.find(item[:user_item_id])
      @user_item.status = 'Pending'
      @user_item.save
      render json: @request_user_item, status: :created
    else
      head :bad_request
    end
  end

  private

  def request_user_item_param
    params.require(:request)
          .permit(:user_item_id, :user_id, :mailing_address, :return_date)
  end

  def item
    params.require(:request)
          .permit(:user_item_id)
  end
end
