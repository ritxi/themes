require 'spec_helper'

describe Themes do
  describe 'attribute#name' do
    it { Themes.name.should == 'test' }
  end

  describe 'attribute#email' do
    it { Themes.email.should == 'test@test.cat' }
  end
end