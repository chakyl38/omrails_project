class TweetsController < InheritedResources::Base
	before_action :set_tweet, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@tweets = Tweet.all
	end

	def show
		@tweet = Tweet.find(params[:id])
	end

	def new
		@tweet = current_user.tweets.new
	end

	def edit
	end

	def create
		@tweet = current_user.tweets.new(tweet_params)

		respond_to do |format|
			if @tweet.save
				format.html { redirect_to @tweet, notice: 'Tweet created Succefully!'  }
				format.json { render :show, status: :created, location: @tweet }
			else
				format.html { render :new }
				format.json { render json: @tweet.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @tweet.update(tweet_params)
				format.html { redirect_to @tweet, notice: 'Tweet updated!'  }
				format.json { render :show, status: :ok, location: @tweet }
			else
				format.html { render :edit }
				format.json { render json: @tweet.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@tweet.destroy
		respond_to do |format|
			format.html { redirect_to tweet_url, notice: 'Tweet was destroyed' }
			format.json { head :no_content }
		end
	end

  private

  	def set_tweet
  		@tweet = current_user.tweets.find(params[:id])
  	end

    def tweet_params
      params.require(:tweet).permit(:content)
    end
end

