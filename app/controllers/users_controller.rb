class UsersController < ApplicationController
  def show
    @notes = Note.where(user_id: current_user.id)
  end
end
