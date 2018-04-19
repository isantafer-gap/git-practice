require 'site_prism'

class Dashboard < SitePrism::Page

  set_url("/zport/dmd/Dashboard")

  element :sign_out_button, :xpath, "//*[@id='sign-out-link']"

  def sign_out()
      sign_out_button.click
  end

end
