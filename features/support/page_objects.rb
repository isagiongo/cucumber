require_relative 'pages/sections'


#metodos que instanciam as páginas
module Pages
    def login 
        return LoginPage.new
    end

    def dash
        return DashPage.new
    end

    def customer
        return CustomerPage.new
    end
end