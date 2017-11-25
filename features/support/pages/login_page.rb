require_relative 'sections'

class LoginPage < SitePrism::Page
    set_url '/login'

    section :nav, Sections::Nav, '#navbar'  
    
    element :email, '#email'
    element :password, 'input[type=password]'
    element :sign_in, 'button[id*=btnLogin]'
    element :alert, '#login-errors'

    def do_login(email,password)
        self.email.set email
        self.password.set password
        self.sign_in.click
    end

end
