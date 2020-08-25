class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: %i[new create]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @article = Article.new
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to root_path, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:body)
  end
end
