require 'rails_helper'

describe Image do
  describe '#create'do
  it 'note_id（外部キー）が存在すれば投稿可' do
    image = build(:image)
    expect(image).to be_valid
  end
  end
end