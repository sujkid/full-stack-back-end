# User Items Controller
class UserItemsController < ApplicationController
  before_action :authenticate

  def index
    @user_items = UserItem.all
    render json: @user_items
  end

  # GET '/retrieve_user_items'
  def retrieve_user_items
    # user_item = UserItem.where('user_id=?', params[:user_id])
    @user_item = UserItem.where('user_id=?', current_user.id)
    render json: @user_item
  end

  # POST '/create-user-item'
  def add_user_item
    @user_item = current_user.user_items.build(item_data)
    if @user_item.save
      render json: @user_item, status: :created
    else
      head :bad_request
    end
  end

  # DELETE '/delete-user-item'
  def delete_user_items
    @user_item = current_user.user_items.find(params[:id])
    @user_item.destroy
  end

  # GET '/search-user-item'
  def search_user_items
    # user_items = UserItem.joins('INNER JOIN users ON users.id= user_items.user_id').where('user_items.name like ? and user_items.user_id!=?', "%#{item[:name]}%", item[:user_id])
    user_items = UserItem.select('user_items.name, user_items.description, user_items.id, user_items.user_id, user_items.status, users.name as user_name').joins(:user).where('user_items.name like ? and user_items.user_id!=?', "%#{item[:name]}%", item[:user_id])
    render json: user_items, each_serializer: UserItem::SearchItemSerializer
  end

  def update_user_items
    @update_user_item = current_user.user_items.find(params[:id]).update(user_item_update)
    render json: @update_user_item
  end

  private

  def item_data
    params.require(:item)
          .permit(:name, :description, :user_id, :status)
  end

  # def delete_data
  #   params.require(:item)
  #         .permit(:name, :description, :user_id)
  # end

  def search_data
    params.require(:item)
          .permit(:name, :user_id)
  end

  def item
    params.require(:item)
          .permit(:name, :user_id)
  end

  def user_item_update
    params.require(:edit)
          .permit(:name, :description, :id)
  end
end
