json.extract! item_basic, :id, :itemid, :subid, :name, :sortname, :stackSize, :flags, :aH, :NoSale, :BaseSel, :created_at, :updated_at
json.url item_basic_url(item_basic, format: :json)
