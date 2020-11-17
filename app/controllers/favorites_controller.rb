class FavoritesController < ApplicationController
  before_action :set_note, only: [:create, :destroy]

  def create
    @favorite = Favorite.create(user_id: current_user.id, note_id: @notes.id)
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, note_id: @notes.id)
    @favorite.destroy
  end

  private
  def set_note
    @notes = Note.find(params[:note_id])
  end
end
