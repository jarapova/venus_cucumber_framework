Given(/^that the Sing Up page is displayed$/) do
  if VN_AllPage.isVenus?
    VN_RegistrationPage.visit_sign_in_page
  elsif REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end
#maybe useless
When(/^the user selects Create Account button$/) do
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end

Then(/^user able to create new account using "([^"]*)" personal data$/) do |user_id|
  if REV_AllPage.isRevolve?
    p  "REV step definition in progress"
    p "REV step definition in progress"
  end
end