require 'rails_helper'

describe ArticlesController, type: :controller do
  let(:params) { {} }
  let(:params_create) { {article: {title: "Title 2", body: "Body 2"}} }
  let(:params_update) { {article: {title: "Title 3", body: "Body 3"}} }
  let(:params_article_to_be_deleted) { {article: {title: "Title 4", body: "Body 4"}} }

  before(:each) do |test|
    create(:article)
  end

  context "GET #index" do
    it "show articles" do
      get :index, params: params
      expect(assigns(:articles).size).to be_equal(1)
    end
  end

  context "GET admin/index" do
    it "show articles" do
      get :index_admin, params: params
      expect(assigns(:articles).size).to be_equal(1)
    end
  end

  context "GET show" do
    it "show article" do
      get :create, params: params_create
      get :show, params: { id: Article.first.id }
      expect(assigns(:article).title).to be_in(params_create[:article][:title])
    end
  end  

  context "POST create" do
    it "add article" do
      get :create, params: params_create
      expect(Article.where(title: params_create[:article][:title]).count).to be_equal(1)
    end
  end

  context "POST update" do
    it "update article" do
      get :update, params: params_update
      expect(Article.where(title: params_update[:article][:title]).count).to be_equal(1)
    end
  end

  context "POST delete" do
    it "delete article" do
      get :create, params: params_article_to_be_delete
      get :delete, params: {id: Article.last.id}
      expect(Article.where(title: params_article_to_be_delete[:article][:title]).count).to be_equal(0)
    end
  end
end

