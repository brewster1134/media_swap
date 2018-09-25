class ItemsController < ApplicationController
  include ItemsHelper
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    skip_authorization
    @items = policy_scope(Item).all
  end

  def show
  end

  def new
    skip_authorization
    @item = policy_scope(Item).new
  end

  def edit
  end

  def create
    skip_authorization
    @item = policy_scope(Item).new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    @item.user = current_user

    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_url, notice: 'Item was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      skip_authorization
      @item = policy_scope(Item).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:user_id, :name, :medium, :platform, :description)
    end
end
