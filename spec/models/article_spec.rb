require "rails_helper"

RSpec.describe Article, type: :model do
  describe "#body" do
    let(:article) { create(:article) }
    subject { article.is_valid }

    context "when body is nil" do
      let(:body) { nill }
      it "bao loi" do
        is_expected.to eq False
      end
    end
  end
end
