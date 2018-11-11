class OwnershipsController < ApplicationController
  def create
    @item = Item.find_or_initialize_by(code: params[:item_code])
    
  #補足情報↓
    unless @item.persisted?
      result = RakutenWebService::Ichiba::Item.search(itemCode: params[:item_code])
      @item = Item.new(read(result.first))
      @item.save
    end 
    
    if params[:type] == "Want"
      current_user.want(@item)
      flash[:success] = "商品をWantしました"
    else
      current_user.have(@item)
      flash[:success] = "商品をHaveしました"
      
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:id])
    
    if params[:type] == "Want"
      current_user.unwant(@item)
      flash[:success] = "商品の Want を解除しました。"
    else
      current_user.unhave(@item)
      flash[:success] = "商品の  Have を解除しました。"
    end
    redirect_back(fallback_location: root_path)
    
  end
#補足情報
  #(@item.persisted?でfalseの場合)
    #①まずは"items"テーブルへの保存　②次に"wants"もしくは"have"テーブルへの保存
  #(@item.persisted?でtrueの場合)
    #上記の②のみ
end


