Then(/^user is on Press catalog page$/) do
  if AN_AllPage.isAnnie?
    AN_CatalogPage.press_catalog_page_expect
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end