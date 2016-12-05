class RequestsController < ProtectedController
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

  def inbox_user_item
    @req = Request.select('requests.id as id, user_items.name, user_items.description, user_items.id as user_items_id, user_items.user_id, user_items.status, users.name as user_name, requests.mailing_address, requests.return_date').joins('INNER JOIN users on users.id = requests.user_id').joins('INNER JOIN user_items on user_items.id = requests.user_item_id').where('user_items.status =? and user_items.user_id=?', 'Pending', current_user.id)

    # Request.select('user_items.name, user_items.description, user_items.id, user_items.user_id, user_items.status, users.name as user_name, requests.mailing_address, requests.return_date').joins('INNER JOIN users on users.id = requests.user_id').joins('INNER JOIN user_items on user_items.id = requests.user_item_id').where('user_items.status =? and user_items.user_id=?', 'Pending', 1)
    render json: @req, each_serializer: UserItem::RequestInboxSerializer
  end

  def accept_request
    @accept_req = current_user.user_items.find(params[:id])
    @accept_req.status = 'Accepted'
    if @accept_req.save
      render json: @accept_req, status: :created
    else
      head :bad_request
    end
  end

  def reject_request
    @reject_req = Request.find_by user_item_id: params[:id]
    # @reject_req = Request.where('user_item_id=?', 43)
    @reject_req.destroy
    @user_item = current_user.user_items.find(params[:id])
    @user_item.status = 'Available'
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
