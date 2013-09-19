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
end