class ArticlesController < ApplicationController
	before_action :set_article, only:[:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only:[:edit, :update, :destroy, :new]
	before_action :correct_user, only: [:edit, :update, :destroy]
	def new
		@article = current_user.articles.build
	end

	def show
 	end

	def create
		@article = current_user.articles.build(article_params)
		if @article.save
			flash[:notice] = "Article was successfully created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def index
  		@articles = Article.all
	end

	def edit
	end

	def update
  		if @article.update(article_params)
  			flash[:notice] = "Article was updated"
   			redirect_to article_path(@article)
  		else
   			flash[:notice] = "Article was not updated"
   			render 'edit'
  		end
	end

	def destroy
		@article.destroy
		flash[:notice] = "Article was deleted"
  		redirect_to articles_path
	end

	private

	def correct_user
		@article = current_user.articles.find_by(id: params[:id])
		redirect_to articles_path , notice: "Not authorised to edit" if @article.nil?
	end

	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description, :user_id)
	end
end