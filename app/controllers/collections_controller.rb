class CollectionsController < ApplicationController
  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @collections }
    end
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
    @collection = Collection.find(params[:id])
    
    # @collection = Collection.paginate(params[:id], {
    #       :order    => :created_at.asc,
    #       :per_page => 25, 
    #       :page     => 3,
    #     })
    
    @items = Item.where(:item_type => @collection.item_type).all
    
    @attr_count = 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collection }
    end
  end
  
  def show_unless_blank(att)
    unless @collection.att.blank?
  	  @collection.att 
    end 
    
  end

  # GET /collections/new
  # GET /collections/new.json
  def new
    @collection = Collection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collection }
    end
  end

  # GET /collections/1/edit
  def edit
    @collection = Collection.find(params[:id])
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(params[:collection])
    
    i = 0
    params[:collection].each_value {|v| i += 1 unless v.blank? }
    
    @collection.attr_count = i - 2

    respond_to do |format|

      if @collection.save
        format.html { redirect_to current_user, notice: "Collection was successfully created." }
        format.json { render json: @collection, status: :created, location: @collection }
      else
        format.html { render action: "new" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /collections/1
  # PUT /collections/1.json
  def update
    @collection = Collection.find(params[:id])

    respond_to do |format|
      if @collection.update_attributes(params[:collection])
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection = Collection.find(params[:id])

    # destroy all items too
    items = Item.where(:collection_id => params[:id])
    items.each {|i| i.destroy } 

    @collection.destroy

    respond_to do |format|
      format.html { redirect_to "/users/#{cookies[:_id]}" }
      format.json { head :no_content }
    end
  end
end
