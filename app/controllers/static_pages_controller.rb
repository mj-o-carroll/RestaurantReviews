class StaticPagesController < ApplicationController
  def home
    @review = current_user.reviews.build if signed_in?
end

  def help
  end

  def about
  end

end
