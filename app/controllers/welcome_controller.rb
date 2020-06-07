class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    #@test= Pnj.where(studentid: current_user.studentid).first
  end
end
