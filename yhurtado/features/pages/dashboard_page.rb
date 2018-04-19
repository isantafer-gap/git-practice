class DashboardPage < SitePrism::Page
  set_url('/zport/dmd/Dashboard')
  element :signout_button, 'div#sign-out-link a'
end
