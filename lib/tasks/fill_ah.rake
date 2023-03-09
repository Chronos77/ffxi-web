
desc "Fill FFXI AH"
task fill_ah: [:environment] do
  multiplier = 50
  ItemBasic.where({ NoSale: 0}).each do |item|
    nbRecordInAuctionHouse = AuctionHouse.where({ itemid: item.itemid }).count
    AuctionHouse.create({
      itemid: item.itemid,
      stack: 0,
      seller: 0,
      seller_name: 'FLEME',
      date: Time.now.to_i,
      price: item.BaseSell * multiplier,
      buyer_name: 'FLEME',
      sale: item.BaseSell * multiplier,
      sell_date: Time.now.to_i
    })
    if item.stackSize > 1 then
      AuctionHouse.create({
        itemid: item.itemid,
        stack: 1,
        seller: 0,
        seller_name: 'FLEME',
        date: Time.now.to_i,
        price: item.BaseSell * item.stackSize * multiplier,
        buyer_name: 'FLEME',
        sale: item.BaseSell * item.stackSize * multiplier,
        sell_date: Time.now.to_i
      })
    end

    for a in nbRecordInAuctionHouse..9 do
      
      if item.stackSize > 1 then
        AuctionHouse.create({
          itemid: item.itemid,
          stack: 1,
          seller: 0,
          seller_name: 'FLEME',
          date: Time.now.to_i,
          price: item.BaseSell * item.stackSize * multiplier
        })
      end
      AuctionHouse.create({
        itemid: item.itemid,
        stack: 0,
        seller: 0,
        seller_name: 'FLEME',
        date: Time.now.to_i,
        price: item.BaseSell * multiplier
      })
    end
  end
  
end