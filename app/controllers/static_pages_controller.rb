class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
  
  def help
  end

  def about
  end

  def signin
  end

  def blog
  end

  def status
  end

  def terms
  end

  def privacy
  end

  def advertisers
  end

  def business
  end

  def developers
  end

  def resources
  end

  def media
  end
end
