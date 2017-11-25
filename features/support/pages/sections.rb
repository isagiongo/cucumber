module Sections
    
    class Nav < SitePrism::Section
        element :user_menu, '#usermenu'
        element :logout, 'a[href$=logout]'
    end
    
    
    class Modal < SitePrism::Section
        element :confirm_button, 'button[data-bb-handler=success]'
        element :cancel_button, 'button[data-bb-handler=danger]'
    end
end