class ItemsController < ApplicationController
  
  layout Proc.new { |controller| controller.request.xhr? ? 'detail' : 'application' }

  def index
    redirect_to current_user
  end
  
  def show
    
    @item = Item.find(params[:id])
    @owner = User.find(@item.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @card }
    end
  end
  
  def new
    @item = Item.new
    @template = Collection.find(params[:collection_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  def create
    @item = Item.new(params[:item])
    @template = Collection.find(@item.collection_id)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @template, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @template = Collection.find(@item.collection_id)
    @item.destroy

    respond_to do |format|
      format.html { redirect_to @template }
      format.json { head :no_content }
    end
  end
end
