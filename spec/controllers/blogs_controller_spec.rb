require 'spec_helper'

describe Admin::BlogsController do

  describe 'PUT blog 修改' do
    subject {FactoryGirl.create :blog}
    it 'updates a blog extra info' do
      put :update, id: subject.id
      response.should redirect_to admin_blog_path(subject)
    end
  end

  describe 'POST blog 创建' do
    it 'create a blog info' do
      post :create
      response.should redirect_to admin_blog_path(assigns[:blog].id)
    end
  end

  describe 'DELETE blog 删除' do
    subject {FactoryGirl.create :blog}
    it 'destroy a blog info' do
      delete :destroy, id: subject
      response.should redirect_to admin_blogs_path
    end
  end
end