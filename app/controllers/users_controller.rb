class UsersController < ApplicationController
  def show
    @notes = Note.with_attached_images.where(user_id: current_user.id)
    @favorites = Favorite.includes(:note).where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:notice] = 'ユーザー情報を編集しました。'
      else
        flash[:alert] = 'ユーザー情報の編集に失敗しました。'
      end
    end
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
