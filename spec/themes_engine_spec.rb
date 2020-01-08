require 'spec_helper'

describe Themes do
  let(:theme) { Themes.model_class ? 'testdb' : 'test' }
  let(:email) { Themes.model_class ? 'testdb@test.cat' : 'test@test.cat' }
  let(:loader) { Themes.model_class ? TestdbLoader : TestLoader }
  before { Themes.themes_list[theme].call }

  describe 'attribute#name' do
    it { expect(Themes.name).to eq(theme) }
  end

  describe 'attribute#email' do
    it { expect(Themes.email).to eq(email) }
  end

  describe 'rails configurations' do
    it { expect(ActionMailer::Base.default).to include(from: email) }

    it { expect(ActionController::Base.instance_methods).to include(:current_theme) }
  end

  describe 'theme environment configuration' do
    before do
      loader.test { @env_test = true }
      loader.production { @env_production = true }
    end

    it { expect(@env_production).to be_falsey }
    it { expect(@env_test).to be(true) }
  end
end
