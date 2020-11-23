require 'rails_helper'
describe Note do
  describe '#create' do

    it 'ノートタイトルがない場合は投稿不可' do
      note = build(:note, title: nil)
      note.valid?
      expect(note.errors[:title]).to include("を入力してください")
    end

    it '対象が選択されていない場合は投稿不可' do
      note = build(:note, status: nil)
      note.valid?
      expect(note.errors[:status]).to include("を入力してください")
    end

    it '科目が選択されていない場合は投稿不可' do
      note = build(:note, subject: nil)
      note.valid?
      expect(note.errors[:subject]).to include("を入力してください")
    end

    it 'ノート説明が記入されていない場合は投稿不可' do
      note = build(:note, text: nil)
      note.valid?
      expect(note.errors[:text]).to include("を入力してください")
    end
  end
end
