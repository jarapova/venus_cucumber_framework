And(/^user see customer care phone number in footer$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user make call action by click by clicking on phone number$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see "([^"]*)" social_icon on footer_modal$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  elsif VN_AllPage.isVenus?
    p  "VN step definition in progress"
    p "VN step definition in progress"
  end
end

And(/^user see privacy policy link in the footer$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click on email subscription field in the footer$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end



And(/^user click "([^"]*)" link in the footer$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user click location preferences button in the footer$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user see location preferences modal$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user chose "([^"]*)" as ship to option$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user chose "([^"]*)" as language option$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user chose "([^"]*)" as currency option$/) do |arg|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user press update preferences button$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user see page with updated location preferences$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user see copyright information in the footer$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

And(/^user can see "([^"]*)" on footer$/) do |content_name_to_check|
  if VN_AllPage.isVenus?
    VN_FooterModalPage.expect_content_footer(content_name_to_check)
    end
end

And(/^user click "([^"]*)" on footer$/) do |element_name_to_click|
  if VN_AllPage.isVenus?
    VN_FooterModalPage.click_item_footer(element_name_to_click)
  end
end

