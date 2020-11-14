require 'rails_helper'
describe Note do
  describe '#create' do

    it '必須項目が全て入力できていたら投稿可' do
      # Image = FactoryBot.create(:image).id
      note = build(:note)
      expect(note).to be_valid
    end

    it 'ノートタイトルがない場合は投稿不可' do
      note = build(:note, title: nil)
      note.valid?
      expect(note.errors[:title]).to include("can't be blank")
    end

    it '対象が選択されていない場合は投稿不可' do
      note = build(:note, status: nil)
      note.valid?
      expect(note.errors[:status]).to include("can't be blank")
    end

    it '科目が選択されていない場合は投稿不可' do
      note = build(:note, subject: nil)
      note.valid?
      expect(note.errors[:subject]).to include("can't be blank")
    end

    it 'ノート説明が記入されていない場合は投稿不可' do
      note = build(:note, text: nil)
      note.valid?
      expect(note.errors[:text]).to include("can't be blank")
    end
  end
end
