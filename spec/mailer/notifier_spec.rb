# encoding: utf-8

describe Notifier do
  context "with custom" do
    let(:theme) { Themes.model_class ? 'testdb' : 'test' }
    let(:body) do
      if Themes.model_class
        /wellcome to this awsome app themed message testdb/m
      else
        /wellcome to this awsome app themed message/m
      end
    end
    let(:user) { mock_model("User", email: 'test@test.cat') }
    subject { Themes.as(theme) { Notifier.wellcome_message(user).body } }

    describe "#body" do
      it { is_expected.to match(body) }
    end
  end

  context "with default" do
    let(:user) { mock_model("User", email: 'test@test.cat') }
    subject { Notifier.good_bye_message(user).body }

    describe "#body" do
      it { is_expected.to match(/we are unhappy to see you leaving this app with default message/m) }
    end
  end
end
