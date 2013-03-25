class CommentsController < ApplicationController
  before_filter :find_showdown

  # GET /topics
  # GET /topics.json
  def index
    @comments = @showdown.comments.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    @comment = @showdown.comments.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    
    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @comment }
    end
  end

  # GET /topics/1/edit
  def edit
    @comment = @showdown.comments.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    #comment = @showdown.comments.new(params[:comment])

    respond_to do |format|
      if @showdown.comments.create!(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.js
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.js
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
    @comment = @showdown.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:topic])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @comment = @showdown.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end
  
  private
  def find_showdown
    @showdown = Showdown.find params[:showdown_id]
  end
end
