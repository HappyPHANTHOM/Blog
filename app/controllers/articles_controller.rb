class ArticlesController < ApplicationController

    before_action :find_article, only: [:show, :edit, :update, :destroy]
    #haciendo esto ya no repito caodigo/ 
    before_action :authenticate_user!, only:[:new,:create,:edit,:update,:destroy]

    def index
        @articles = Article.all
    end

    def show
        #@article4 = Article.find(params[:id]) <----ESTO LO ELIMINE Y LO PASE  A  before_action :find_article para que se haga antes de cada accion/
    end

    def edit
        #@article4 = Article.find(params[:id]) <----ESTO LO ELIMINE Y LO PASE  A  before_action :find_article para que se haga antes de cada accion/
        @categories = Category.all
    end

    def update
        #@article4 = Article.find(params[:id]) <----ESTO LO ELIMINE Y LO PASE  A  before_action :find_article para que se haga antes de cada accion/
        @article.update(article_params)
        @article.save_categories
        redirect_to @article
    end

    def new
        @article = Article.new
        @categories = Category.all
    end

    def create
        #@article4 = Article.find(params[:id]) <----ESTO LO ELIMINE Y LO PASE  A  before_action :find_article para que se haga antes de cada accion/
        #@article = current_user.articles.create(title: params[:article][:title],
                                    #content: params[:article][:content])
        @article = current_user.articles.create(article_params)
        @article.save_categories
        #render json: @article
        redirect_to @article
    end

    def destroy
        #@article4 = Article.find(params[:id]) <----ESTO LO ELIMINE Y LO PASE  A  before_action :find_article para que se haga antes de cada accion/
        @article.destroy
        redirect_to root_path
    end

    def from_author
        @user = User.find(params[:user_id])
    end

    def find_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title,:content, category_elements: [])
    end

end
