# encoding: utf-8
require 'spec_helper'

describe PostsController, type: :feature do
  describe "#index" do
    before do
      Capybara.app_host = "http://#{theme}"
      visit '/posts'
    end

    context "render_views with theme custom views" do
      let(:theme) { Themes.model_class ? 'testdb' : 'test' }
      let(:content) do
        if Themes.model_class && ENV['RAILS_VERSION'] =~ /\ddb/
          /Posts index from theme db/m
        else
          /Posts index from theme/m
        end
      end
      let(:layout) do
        if Themes.model_class && ENV['RAILS_VERSION'] =~ /\ddb/
          /Test theme layout db/m
        else
          /Test theme layout/m
        end
      end

      it { expect(page).to have_content(content) }
      it { expect(page).to have_content(layout) }
      if ENV['RAILS_VERSION'] =~ /\ddb/
        it { expect(page).to have_content(/setting1: foo/) }
        it { expect(page).to have_content(/setting2: bar/) }
      end
    end

    context "render_views with theme custom views" do
      let(:theme) { Themes.model_class ? 'testdb2' : 'test2' }

      let(:content) do
        if Themes.model_class && ENV['RAILS_VERSION'] =~ /\ddb/
          /Posts index from theme testdb2/m
        else
          /Posts index from theme test2/m
        end
      end
      let(:layout) do
        if Themes.model_class && ENV['RAILS_VERSION'] =~ /\ddb/
          /Test2 theme layout db2/m
        else
          /Test2 theme layout/m
        end
      end

      it { expect(page).to have_content(content) }
      it { expect(page).to have_content(layout) }

      if ENV['RAILS_VERSION'] =~ /\ddb/
        it { expect(page).to have_content(/setting1: foo2/) }
        it { expect(page).to have_content(/setting2: bar2/) }
      end
    end

    context "render_views with default views" do
      let(:theme) { 'localhost' }

      it { expect(page).to have_content(/Default posts index/m) }
      it { expect(page).to have_content(/Default layout/m) }
    end
  end
end
