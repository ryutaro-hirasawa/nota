class UsersController < ApplicationController
  def show
    @notes = Note.where(user_id: current_user.id)
    @favorites = Favorite.where(user_id: current_user.id)
  end
end
