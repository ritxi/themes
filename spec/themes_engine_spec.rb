require 'spec_helper'

describe Themes do
  describe 'attribute#name' do
    it { Themes.name.should == 'test' }
  end

  describe 'attribute#email' do
    it { Themes.email.should == 'test@test.cat' }
  end

  describe 'rails configurations' do
    it { expect(ActionMailer::Base.default).to include(from: 'test@test.cat') }

    it { expect(ActionController::Base.instance_methods).to include(:current_theme) }
  end

  describe 'theme environment configuration' do
    before do
      Themes::Loader.test { @env_test = true }
      Themes::Loader.production { @env_production = true }
    end

    it { @env_production.should be_false }
    it { @env_test.should be_true }
  end
end