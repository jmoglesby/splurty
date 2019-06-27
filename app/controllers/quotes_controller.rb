class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)

    if @quote.errors[:saying].any?
      if @quote.errors[:saying].include? "profanity"
        flash[:error] = '<strong>Could not save</strong> - your quote cannot include profanity.'
      else
        flash[:error] = '<strong>Could not save</strong> - your quote must be 3-140 characters in length.'
      end
    end

    if @quote.errors[:author].any?
      flash[:error] = '<strong>Could not save</strong> - you must provide a character name 3-50 characters in length.'
    end
    
    redirect_to root_path
  end

  def about
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author)
  end
end
