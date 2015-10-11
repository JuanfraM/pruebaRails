class HomeController < ApplicationController
#index, show, new, edit, create, update, destroy

  # http_basic_authenticate_with name: "juanfra", password: "juanfra", except: [:index, :show]
  #before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title,:text)
  end

end
