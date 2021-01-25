crumb :root do
  link "Top", root_path
end

crumb :category do |item|
  link "#{item.category.name}"
  parent :root
end

crumb :item_show do |item|
  link "#{item.name}", item_path(item)
  parent :category, item
end

crumb :item_purchase do |item|
  link "#{item.name}購入", root_path
  parent :item_show, item
end