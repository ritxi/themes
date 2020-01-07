# encoding: utf-8

describe Notifier do
  context "with custom" do
    let(:user) { mock_model("User", email: 'test@test.cat') }
    subject { Themes.as('test') { Notifier.wellcome_message(user) } }


    describe "#body" do
      it { expect(subject.body).to match /wellcome to this awsome app themed message/m}
    end
  end

  context "with default" do
    let(:user) { mock_model("User", email: 'test@test.cat') }
    subject { Notifier.good_bye_message(user) }

    describe "#body" do
      it { expect(subject.body).to match /we are unhappy to see you leaving this app with default message/m}
    end
  end
end
