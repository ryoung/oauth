class AuthController < ApplicationController
  def callback
    data = request.env['omniauth.auth'].to_hash
    puts data.inspect
    if data["info"]
      @user = User.where(provider: data["provider"], provider_uid: data["uid"]).first
      unless @user
        @user = User.new(provider: data["provider"], provider_uid: data["uid"])
        @user.email = data["info"]["email"] if data["info"]["email"]
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
