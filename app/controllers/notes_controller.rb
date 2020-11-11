class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
    @note.images.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :status, :subject, :text, images_attributes: [:src]).merge(user_id: current_user.id)
  end
end
