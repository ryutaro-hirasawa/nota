require 'rails_helper'

describe FavoritesController do
  describe 'delete #destroy' do
    it "お気に入り解除ができているか" do
      favorite = create(:favorite)
      expect do
        delete :destroy, params: { id: favorite }
      end.to change(Favorite, :count).by(-1)
    end
  end
end
