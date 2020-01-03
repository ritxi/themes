# encoding: utf-8
require 'spec_helper'

describe PostsController, type: :feature do
  describe "#index" do
    before { visit '/posts' }

    context "render_views with theme custom views" do
      it { expect(page).to have_content /Posts index from theme/m }
      it { expect(page).to have_content /Test theme layout/m }
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
