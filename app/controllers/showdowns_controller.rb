class ShowdownsController < ApplicationController
  # GET /showdowns
  # GET /showdowns.json
  def index
    @showdowns = Showdown.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @showdowns }
    end
  end

  # GET /showdowns/1
  # GET /showdowns/1.json
  def show
    @showdown = Showdown.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @showdown }
    end
  end

  # GET /showdowns/new
  # GET /showdowns/new.json
  def new
    @showdown = Showdown.new
    @topics = Topic.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @showdown }
    end
  end

  # GET /showdowns/1/edit
  def edit
    @showdown = Showdown.find(params[:id])
  end

  # POST /showdowns
  # POST /showdowns.json
  def create
    @showdown = Showdown.new(params[:showdown])

    respond_to do |format|
      if @showdown.save
        format.html { redirect_to @showdown, notice: 'Showdown was successfully created.' }
        format.json { render json: @showdown, status: :created, location: @showdown }
      else
        format.html { render action: "new" }
        format.json { render json: @showdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /showdowns/1
  # PUT /showdowns/1.json
  def update
    @showdown = Showdown.find(params[:id])

    respond_to do |format|
      if @showdown.update_attributes(params[:showdown])
        format.html { redirect_to @showdown, notice: 'Showdown was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @showdown.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /showdowns/1
  # DELETE /showdowns/1.json
  def destroy
    @showdown = Showdown.find(params[:id])
    @showdown.destroy

    respond_to do |format|
      format.html { redirect_to showdowns_url }
      format.json { head :no_content }
    end
  end
  
  def add_vote
    @showdown = Showdown.find(params[:id])
    if params[:topic_id]
      topic = Topic.find(params[:topic_id])
      vote = Vote.new(:topic_id=>topic.id, :showdown_id=>@showdown.id)
      if vote.save
        format.html { redirect_to @showdown, notice: 'Vote was successfully created.' }
        format.json { render json: @showdown, status: :created, location: @showdown }
      else
        format.html { render action: "new" }
        format.json { render json: @showdown.errors, status: :unprocessable_entity }
      end
    end
  end
end
