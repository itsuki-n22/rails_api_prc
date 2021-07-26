class Api::V1::ListsController < Api::V1::Base

  def index
    p params
    p lists = User.find(session[:user_id]).lists.all
    
    render json: lists , status: 200
    
  end

  private
    def list_params
      params.require(:list).permit(:user_id)
    end
end