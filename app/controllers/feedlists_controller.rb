class FeedlistsController < ApplicationController
  # GET /feedlists
  # GET /feedlists.json
  def index
    @feedlists = Feedlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feedlists }
    end
  end

  # GET /feedlists/1
  # GET /feedlists/1.json
  def show
    @feedlist = Feedlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feedlist }
    end
  end

  # GET /feedlists/new
  # GET /feedlists/new.json
  def new
    @feedlist = Feedlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedlist }
    end
  end

  # GET /feedlists/1/edit
  def edit
    @feedlist = Feedlist.find(params[:id])
  end

  # POST /feedlists
  # POST /feedlists.json
  def create
    # @folders, @strayfeeds, @total = Feedlist.interpret_subs(params[:feedlist][:feed_text])
    # raise [@folders, @strayfeeds, @total]
    # raise @folders.inspect
    @feedlist = Feedlist.new(params[:feedlist])

    respond_to do |format|
      if @feedlist.save
        format.html { redirect_to @feedlist, notice: 'Feedlist was successfully created.' }
        format.json { render json: @feedlist, status: :created, location: @feedlist }
      else
        format.html { render action: "new" }
        format.json { render json: @feedlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feedlists/1
  # PUT /feedlists/1.json
  def update
    @feedlist = Feedlist.find(params[:id])

    respond_to do |format|
      if @feedlist.update_attributes(params[:feedlist])
        format.html { redirect_to @feedlist, notice: 'Feedlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feedlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedlists/1
  # DELETE /feedlists/1.json
  def destroy
    @feedlist = Feedlist.find(params[:id])
    @feedlist.destroy

    respond_to do |format|
      format.html { redirect_to feedlists_url }
      format.json { head :no_content }
    end
  end
end
