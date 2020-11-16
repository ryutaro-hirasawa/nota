class NotesController < ApplicationController
  def index
    @notes = Note.all.order('created_at DESC')
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.valid?
      @note.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @notes = Note.find(params[:id])
    @comment = Comment.new
    @comments = @notes.comments.includes(:user)
  end

  def destroy
    @notes = Note.find(params[:id])
    @notes.destroy
    redirect_to root_path
  end

  private

  def note_params
    params.require(:note).permit(:title, :status, :subject, :text, images: []).merge(user_id: current_user.id)
  end
end
