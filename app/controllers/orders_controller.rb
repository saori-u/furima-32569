class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item_order,     only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase_history.present?
  end

  def create
    @purchase_address = PurchaseAddress.new(order_params)
      if  @purchase_address.valid?
          pay_item
          @purchase_address.save
          redirect_to root_path
      else
          render action: :index
      end
  end
  
  private
  def order_params
      params.require(:purchase_address).permit(
        :postcode,:area_id,:city,:house_num,:building,:phone_num ,:purchase_history_id, 
      ).merge(
        user_id: current_user.id,
        item_id: params[:item_id],
        token:   params[:token]
      )
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:   @item.price,
        card:     order_params[:token],
        currency: 'jpy'
      )
  end

  def set_item_order
    @item = Item.find(params[:item_id])
  end
end