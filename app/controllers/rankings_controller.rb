class RankingsController < ApplicationController
  def want
    #Want.ranking = {[item_id① => Want の数],[item_id ②=> Want の数]...}
    @ranking_counts = Want.ranking
    @items = Item.find(@ranking_counts.keys)
  end

  def have
    @ranking_counts = Have.ranking
    @items = Item.find(@ranking_counts.keys)
  end
end
