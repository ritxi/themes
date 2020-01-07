# encoding: utf-8
require 'spec_helper'

describe PostsController, type: :feature do
  describe "#index" do
    context "render_views with theme custom views" do
      before do
        Capybara.app_host = 'http://test'
        visit '/posts'
      end

      it { expect(page).to have_content(/Posts index from theme/m) }
      it { expect(page).to have_content(/Test theme layout/m) }
    end

    context "render_views with theme custom views" do
      before do
        Capybara.app_host = 'http://test2'
        visit '/posts'
      end

      it { expect(page).to have_content(/Posts index from theme test2/m) }
      it { expect(page).to have_content(/Test2 theme layout/m) }
    end

    context "render_views with default views" do
      before do
        Capybara.app_host = 'http://localhost'
        visit '/posts'
      end

      it { expect(page).to have_content(/Default posts index/m) }
      it { expect(page).to have_content(/Default layout/m) }
    end
  end
end
