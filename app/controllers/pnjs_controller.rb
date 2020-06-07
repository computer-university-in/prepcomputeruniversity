class PnjsController < ApplicationController
  before_action :set_pnj, only: [:show, :edit, :update, :destroy]

  # GET /pnjs
  # GET /pnjs.json
  def index
    if current_user.studentid != "professor"
       redirect_to '/registered'
    else
      @pnjs = Pnj.all
      @users = User.all
    end
  end

  # GET /pnjs/1
  # GET /pnjs/1.json
  def show
  end

  def registered
  end

  # GET /pnjs/new
  def new
    if test = Pnj.where(studentid: current_user.studentid).first
      redirect_to '/registered'
    else
      @pnj = Pnj.new
    end
  end

  # GET /pnjs/1/edit
  def edit
  end

  # POST /pnjs
  # POST /pnjs.json
  def create
    @pnj = Pnj.new(pnj_params)

    respond_to do |format|
      @pnj.studentid=current_user.studentid
      if @pnj.save
        format.html { redirect_to(@pnj, notice: "Dear #{@current_user.name} your response was successfully stored.") }
        format.json { render :show, status: :created, location: @pnj }
      else
        format.html { render :new }
        format.json { render json: @pnj.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pnjs/1
  # PATCH/PUT /pnjs/1.json
  def update
    respond_to do |format|
      if @pnj.update(pnj_params)
        format.html { redirect_to @pnj, notice: 'Pnj was successfully updated.' }
        format.json { render :show, status: :ok, location: @pnj }
      else
        format.html { render :edit }
        format.json { render json: @pnj.errors, status: :unprocessable_entity }
      end
    end
  end

  def myupdate
    if test = Pnj.where(studentid: "professor").first
      @pnjs.each do |pnj|
        pnj.score="0"
        if pnj.q1==test.q1
          pnj.score=pnj.score.to_i+1
        end
        if pnj.q2==test.q2
          pnj.score=pnj.score.to_i+1
        end
        pnj.update(score: pnj.score)
        #PnjmailerMailer.welcome_email(@users.where(studentid: pnj.studentid).first).deliver_later
      end
    end
  end

  def myemail
    userstudentid = params[:studentid]
    user = User.where(studentid: userstudentid).first
    PnjmailerMailer.welcome_email(user).deliver_later
  end

  helper_method :myupdate, :myemail
  # DELETE /pnjs/1
  # DELETE /pnjs/1.json
  def destroy
    @pnj.destroy
    respond_to do |format|
      format.html { redirect_to pnjs_url, notice: 'Pnj was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def interval seconds
  	loop do
  		yield
  		sleep seconds
  	end
  end

  def my
    interval 5 do
  	   puts "Hey there"
     end
  end

  helper_method :my

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pnj
      @pnj = Pnj.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pnj_params
      params.require(:pnj).permit(:studentid, :q1, :q2, :score)
    end
end
