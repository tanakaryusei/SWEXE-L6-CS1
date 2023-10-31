class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    file = params[:tweet][:file].read
    @tweet = Tweet.new(message: params[:tweet][:message], file: file)
    @tweet.save
    redirect_to tweets_path
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end

  def get_image
    image = Tweet.find(params[:id])
    send_data image.file, disposition: :inline, type: "image/png"
  end
end
