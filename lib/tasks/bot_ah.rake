
desc "Automatically buy item in auction house"
task bot_ah: [:environment] do
  
  pp "BOT_AH: Checking.."
  AuctionHouse.where.not(seller_name: 'FLEME').where(sale: 0).each do |sale_item|
    item = ItemBasic.find_by({ itemid: sale_item.itemid })
    base_price = item.BaseSell
    rand_multiplier = Random.rand(10...20)
    money_to_buy = 0
    if sale_item.stack then
      money_to_buy = (base_price * item.stackSize) * rand_multiplier 
    else
      money_to_buy = base_price * rand_multiplier 
    end

    if money_to_buy.to_i >= sale_item.price.to_i then
      char_inventory_seller = CharInventory.where({ charid: sale_item.seller, itemId: 65535 }).first
      newQuantity = char_inventory_seller.quantity.to_i + money_to_buy.to_i
      char_inventory_seller.update(quantity: newQuantity)
      sale_item.update({ buyer_name: 'BOT_FLEME', sale: money_to_buy, sell_date: Time.now.to_i })
      pp "Buy Item #{item.name}, price: #{money_to_buy}, to: #{sale_item.seller_name}"
    end
  end
end