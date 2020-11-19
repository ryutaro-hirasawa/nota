require 'rails_helper'

describe NotesController do
  describe 'GET #new' do
    it "ノート新規投稿に遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@notesに正しい値が入っている" do
      note = create(:note)
      get :edit, params: { id: note }
      expect(assigns(:note)).to eq note
    end

    it "編集画面に遷移すること" do
      note = create(:note)
      get :edit, params: { id: note }
      expect(response).to render_template :edit
    end

    describe 'GET #index' do
      it "@notesに正しい値が入っていること" do
        notes = create_list(:note, 1)
        get :index
        expect(assigns(:note)).to match(notes)
      end

      it "トップ画面に遷移すること" do
        get :index
        expect(response).to render_template :index
      end
    end
  end
end
