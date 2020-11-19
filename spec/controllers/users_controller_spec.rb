require 'rails_helper'

describe UsersController do
  describe 'GET #edit' do
    it "@userに正しい値が入っている" do
      user = create(:user)
      get :edit, params: { id: user }
      expect(assigns(:user)).to eq user
    end

    it "編集画面に遷移すること" do
      user = create(:user)
      get :edit, params: { id: user }
      expect(response).to render_template :edit
    end
  end

  describe 'delete #destroy' do
    it "退会処理ができているか" do
      user = create(:user)
      expect do
        delete :destroy, params: { id: user }
      end.to change(User, :count).by(-1)
    end
  end
end
