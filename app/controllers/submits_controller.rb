class SubmitsController < ApplicationController
  before_action :set_submit, only: [:show, :edit, :update, :destroy]

  # GET /submits
  # GET /submits.json
  def index
    @submits = Submit.all
  end

  # GET /submits/1
  # GET /submits/1.json
  def show
  end

  # GET /submits/new
  def new
    @submit = Submit.new
  end

  # GET /submits/1/edit
  def edit
  end

  # POST /submits
  # POST /submits.json
  def create
    # MODIFY RUBY HASH IN PLACE
    # Option 1 straight-forward (check out submit_params method)
    # sp = submit_params
    # sp[:user_id] = 1
    # @submit = Submit.new(sp)

    # Option 2 simpler (check out submit_params method)
    submit_params[:user_id] = current_user.user_id
    submit_params[:score] = 0
    @submit = Submit.new(submit_params)

    respond_to do |format|
      if @submit.save
        format.html { redirect_to @submit, notice: 'Submit was successfully created.' }
        format.json { render :show, status: :created, location: @submit }
      else
        format.html { render :new }
        format.json { render json: @submit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submits/1
  # PATCH/PUT /submits/1.json
  def update
    respond_to do |format|
      if @submit.update(submit_params)
        format.html { redirect_to @submit, notice: 'Submit was successfully updated.' }
        format.json { render :show, status: :ok, location: @submit }
      else
        format.html { render :edit }
        format.json { render json: @submit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submits/1
  # DELETE /submits/1.json
  def destroy
    @submit.destroy
    respond_to do |format|
      format.html { redirect_to submits_url, notice: 'Submit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /submits/upvote/1
  def upvote
    @submit = Submit.increment_counter(:score, params[:id])
    redirect_to '/'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submit
      @submit = Submit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submit_params
      # Option 1 straight-forward (check out create method)
      # params.require(:submit).permit(:title, :score, :url, :submit_type, :user_id)

      # Option 2 simpler (check out create method)
      @submit_params ||= params.require(:submit).permit(:title, :score, :url, :submit_type, :user_id)
    end
end
