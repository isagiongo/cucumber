require_relative 'sections'

class DashPage < SitePrism::Page
    section :nav, Sections::Nav, '#navbar'  
    
    element :title, '#page_title'
    element :welcome_message, '#title_row p'
end

