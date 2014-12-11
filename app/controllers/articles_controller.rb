class ArticlesController < ApplicationController
  require 'socket'
  before_action :article_params, only: [:create, :update]

	def index
  		@articles = Article.all
	end

  def show
    @article = Article.find(params[:id])
  end

	def new
    @article = Article.new
	end

	def create
  	@article = Article.new(article_params)
 		@article.save
  	redirect_to @article
	end
 
 	def edit
  		@article = Article.find(params[:id])
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

  def sms
    @article = Article.find(params[:article_id])
    number = params[:number]
    request = 'www.domain.com'
    @article.send_sms(number, request)
    redirect_to @article
  end
 
private
  def article_params
    params.require(:article).permit(:title, :text, :image)
  end

end
