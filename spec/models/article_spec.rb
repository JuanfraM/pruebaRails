require "rails_helper"
require "article"

describe Article do
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_least(5) }

  it "has a valid factory" do
    FactoryGirl.create(:article).should be_valid
  end

  it 'returns right title and text' do
    article = FactoryGirl.create(:article)
    expect(article.title_and_text).to eq (article.title + article.text)
  end
end
