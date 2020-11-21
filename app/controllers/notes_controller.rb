class NotesController < ApplicationController

  before_action :detail_search

  def index
    @notes = Note.all.with_attached_images.order('created_at DESC')
    @all_ranks = Note.find(Favorite.group(:note_id).order('count(note_id) desc').limit(5).pluck(:note_id))
    @random = Note.order("RAND()").limit(5)
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.valid?
      @note.save
      redirect_to root_path
      flash[:notice] = "投稿に成功しました。"
    else
      flash[:alert] = "必須項目が抜けています。"
      render :new
    end
  end

  def show
    @notes = Note.with_attached_images.find(params[:id])
    @comment = Comment.new
    @comments = @notes.comments.includes(:user)
  end

  def destroy
    @notes = Note.find(params[:id])
    @notes.destroy
    flash[:notice] = "削除が完了しました。"
    redirect_to root_path
  end

  def edit
    @notes = Note.find(params[:id])
  end

  def update
    @notes = Note.find(params[:id])
    @notes.update(note_params)
    flash[:notice] = "編集に成功しました。"
    redirect_to root_path
  end

  def search
    @notes = Note.with_attached_images.search(params[:keyword])
  end

  def detail_search
    @search = Note.ransack(params[:q])
    @notes = @search.result(distinct: true)
  end

  private

  def note_params
    params.require(:note).permit(:title, :status, :subject, :text, images: []).merge(user_id: current_user.id)
  end
end
