class HomeController < ApplicationController
  def index
    @users = User.all
    @showdowns = Showdown.all
  end
end
