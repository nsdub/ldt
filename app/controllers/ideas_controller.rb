class IdeasController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin!, except: [:new, :create]
  before_action :set_idea, only: [:show, :edit, :update, :destroy]

  def index
    @ideas = Idea.all
  end
  
  def publish
    @idea = Idea.find(params[:id])
    @idea.published_at = Time.now
    if @idea.save
      flash[:success] = "Video has been successfully published."
    else
      flash[:error] = "There was an error publishing."
    end
    redirect_to ideas_path
  end
  
  def unpublish
    @idea = Idea.find(params[:id])
    @idea.published_at = nil
    if @idea.save
      flash[:success] = "Video has been unpublished."
    else
      flash[:error] = "There was an error unpublishing."
    end
    redirect_to ideas_path
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    if current_user.admin?
      @idea.published_at = Time.now
    end

    respond_to do |format|
      if @idea.save
        format.html { redirect_to new_idea_path, notice: 'Your video suggestion was successfully received.' }
        format.json { redirect_to @idea, status: :created, location: @idea }
        flash[:notice] = "Your video suggestion was successfully received."
      else
        format.html { render action: 'new' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params.require(:idea).permit(:creator_id, :title, :video_url)
    end
end
