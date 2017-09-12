require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'index' do
    it 'returns all posts from current user' do
      post = Post.create(id: 0, content: "I am a post", user_id: 0, created_at: nil, updated_at: nil)
      expect(post.content).to eq("I am a post")
    end
  end
end

RSpec.describe Post, type: :model do
  describe 'belongs_to' do
    it {should belong_to(:user) }
  end
  describe 'association and dependency' do
    it {should have_many(:comments).dependent(:destroy) }
  end
end