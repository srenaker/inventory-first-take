class CollectionsController < ApplicationController

  def search_results
    @search_term = params[:search_term]
    search_field = params[:search_field]
    
    @items = Item.where(search_field.to_sym => @search_term, :collection_id => params[:id]).all
    @collection = Collection.find(params[:id])
  end
  
  def index
    # not in use
    redirect_to current_user
  end

  def show
    @collection = Collection.find(params[:id])
    @available_fields = ["#{@collection.attr1}"]
    @available_fields << @collection.attr2 unless @collection.attr2.blank? 
    @available_fields << @collection.attr3 unless @collection.attr3.blank?
    @available_fields << @collection.attr4 unless @collection.attr4.blank?
    @available_fields << @collection.attr5 unless @collection.attr5.blank?
      
    @items = Item.where(:collection_id => params[:id]).all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @collection }
    end
  end
  
  def new
    @collection = Collection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @collection }
    end
  end

  def create
    @collection = Collection.new(params[:collection])

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

  def destroy
    @collection = Collection.find(params[:id])

    # destroy all items too
    items = Item.where(:collection_id => params[:id])
    items.each {|i| i.destroy } 

    @collection.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.json { head :no_content }
    end
  end
end
