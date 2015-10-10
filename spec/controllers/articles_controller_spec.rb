require "rails_helper"
require "article"

describe ArticlesController do
  before(:each) do
    @a1 = FactoryGirl.create(:article)
    @a2 = FactoryGirl.create(:article)
    @a3 = FactoryGirl.create(:article)
  end

  describe '#index' do
    it 'should assign articles' do
      get :index
      expect(assigns(:articles)).to match_array [@a1, @a2, @a3]
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe '#show' do
    before(:each) do
      @art = FactoryGirl.create(:article)
    end

    it 'should assign article variable properly' do
      get :show, id: @art.id
      expect(assigns(:article)).to eq @art
      expect(response.status).to eq 200
    end
  end

  describe '#create' do
    context 'with valid params' do
      it 'should redirect to show template' do
        post :create, article: { title: 'titulo', text: 'abcd' }
        expect(response).to redirect_to(action: :show, id: assigns(:article).id)
      end

      it 'should create a new article' do
        expect{ post :create, article: { title: 'titulo', text: 'abcd' } }.to change{Article.count}.by 1
      end
    end

    context 'with invalid params' do
      it 'should render new template' do
        post :create, article: { text: 'abcd' }
        expect(response).to render_template(:new)
      end

      it 'should not create a new article' do
        expect{ post :create, article: { text: 'abcd' } }.to change{Article.count}.by 0
      end
    end
  end

  #se usa patch en vez de put
  describe '#update' do
    let(:article) { FactoryGirl.create(:article) }
    before { patch :update, id: article, article:{title: 'juanfra', text: 'algo' }}

    context 'with valid params' do
      it 'should redirect to show template' do
        expect(response).to redirect_to(action: :show, id: assigns(:article).id)
      end

      it 'should not create a new article' do
        expect{}.to change{Article.count}.by 0
      end

    end

  end
end
