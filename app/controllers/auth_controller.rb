class AuthController < ApplicationController
  def callback
    data = request.env['omniauth.auth'].to_hash
    puts data.inspect
    if data["info"] and data["info"]["email"]
      @user = User.where(email: data["info"]["email"]).first
      unless @user
        @user = User.new(email: data["info"]["email"], provider: data["provider"], provider_uid: data["uid"])
        @user.first_name = data["info"]["first_name"] if data["info"]["first_name"]
        @user.last_name = data["info"]["last_name"] if data["info"]["last_name"]
        render "users/new"
      end
    else
      render "failure"
    end
  end

  def failure

  end
end
