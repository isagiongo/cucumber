require_relative 'sections'

class CustomerPage < SitePrism::Page
    set_url '/customers'
    
    #modal
    section :modal, Sections::Modal, '.modal-content'
    section :nav, Sections::Nav, '#navbar'  
    
    element :new, '#dataview-insert-button'
    element :save, '#form-submit-button'

    element :name, '#customers-insert-insert-form > form > div.form-group.field-name > div > input'
    element :phone, 'input[name=phone]'
    element :email, 'input[name=email]'
    element :gender_m, 'input[name="radio-m"]'
    element :gender_f, 'input[name="radio-f"]' 
    element :type, '#type-customer'
    element :note, 'textarea[name=note]'
    element :info, 'input[type=checkbox]'

    def select_type(target)
        self.type.find('option', text: target).select_option
    end

    def select_type_any
        self.type.all('option').sample.select_option
    end
        
    def saves (customer)
        self.new.click
        self.name.set customer['nome']
        self.phone.set customer['telefone']
        self.email.set customer['email']
        self.gender_m.click if customer['sexo'] == 'M'
        self.gender_f.click if customer['sexo'] == 'F'
        self.select_type(customer['tipo'])
        #self.select_type_any 
        self.note.set customer['obs']
        self.info.click
        self.save.click
    end
    #busca
    element :search_input, '#dataview-search-input'
    element :search_button, '#dataview-search-button'
    elements :view, 'table tbody tr'
    element :message_view, '.alert-warning'


    def delete_first
        self.view.first.find('#delete-button').click
    end    
end