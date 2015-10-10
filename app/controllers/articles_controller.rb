class ArticlesController < ApplicationController
#index, show, new, edit, create, update, destroy

  # http_basic_authenticate_with name: "juanfra", password: "juanfra", except: [:index, :show]
  #before_action :authenticate_user!

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new' #render mantiene la peticion con el objeto y retorna los datos al formulario, si usaramos redirect se pierden los datos al volver
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title,:text)
  end

end
