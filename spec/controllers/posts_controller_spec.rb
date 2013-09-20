# encoding: utf-8
require 'spec_helper'

describe PostsController, controller: true do
  describe "#index" do
    before { get :index }

    it { expect(response).to have_rendered('posts/index') }

    context "render_views with theme custom views" do
      render_views

      it { expect(response.body).to match /Posts index from theme/m }
      it { expect(response.body).to match /Test theme layout/m }
    end

    context "render_views with default views" do
      pending "should be able to reload theme path"
      #before do
      #  ENV['APP_THEME']='empty'
      #  subject
      #end
      #render_views
      #
      #it { expect(response.body).to match /Default posts index/m }
      #it { expect(response.body).to match /Default layout/m }
    end
  end
end