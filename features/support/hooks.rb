After('@logout') do
    dash.nav.user_menu.click
    dash.nav.logout.click  
end

After do |scenario|
    @file_name = scenario.name.gsub(' ','_')

    @file_name = @file_name.gsub(',', '')
    @file_name = @file_name.gsub('(', '')
    @file_name = @file_name.gsub(')', '')
    @file_name = @file_name.gsub('#', '')

    @target = "reports/screenshots/#{@file_name.downcase!}.png"
    
    page.save_screenshot(@target)
    embed(@target, 'image/png', 'Ver a evidência')    



    #screenshot apenas dos cenários falhando
   # if scenario.failed?
        
    #end
end