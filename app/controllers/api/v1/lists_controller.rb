class Api::V1::ListsController < Api::V1::Base
  def index
    lists = current_user.lists.all.select(:id,:title,:description,:status)
    render json: lists , status: 200
  end

  def create
    list = current_user.lists.create(list_params)
    render json: list , status: 200
  end

  def update
    list = current_user.lists.find(list_params[:id])
    list.update(list_params)
    render json: list , status: 200
  end

  def destroy
    list = current_user.lists.find(params[:id])
    list.destroy
    render json: list , status: 200
  end

  private
    def list_params
      params.require(:list).permit(:user_id, :id, :title, :description, :status)
    end
end