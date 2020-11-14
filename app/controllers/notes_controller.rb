class NotesController < ApplicationController
  def index
    @notes = Note.includes(:images).order('created_at DESC')
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    # binding.pry
    if @note.valid?
      @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :status, :subject, :text, images: []).merge(user_id: current_user.id)
  end
end
