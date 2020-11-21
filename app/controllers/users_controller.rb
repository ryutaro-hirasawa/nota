class UsersController < ApplicationController
  def show
    @notes = Note.where(user_id: current_user.id)
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "編集に成功しました。"
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "退会処理が完了しました。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
