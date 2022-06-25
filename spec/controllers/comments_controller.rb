require 'rails_helper'

describe CommentsController, type: :controller do
  let(:params) { {} }
  let(:params_create) { {id: Article.first.id, comment: {email: "mark3@mark3.com", body: "Hi all!"}} }

  before(:each) do |test|
    create(:article)
  end

  context "POST #create" do
    it "Add comment" do
      post :create, params: params_create
      expect(Comment.where(email: params_create[:comment][:email]).size).to be_equal(1)
    end
  end

end

