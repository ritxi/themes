require 'spec_helper'

describe Themes do
  before do
    Themes.themes_list['test'].call
  end
  describe 'attribute#name' do
    it { expect(Themes.name).to eq('test') }
  end

  describe 'attribute#email' do
    it { expect(Themes.email).to eq('test@test.cat') }
  end

  describe 'rails configurations' do
    it { expect(ActionMailer::Base.default).to include(from: 'test@test.cat') }

    it { expect(ActionController::Base.instance_methods).to include(:current_theme) }
  end

  describe 'theme environment configuration' do
    before do
      TestLoader.test { @env_test = true }
      TestLoader.production { @env_production = true }
    end

    it { expect(@env_production).to be_falsey }
    it { expect(@env_test).to be(true) }
  end
end
