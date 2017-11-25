#encoding:utf-8

#contexto

Dado(/^usuário "([^"]*)" deve estar logado$/) do |profile|
  login.load
  @user = $data['users'][profile]
  
  login.do_login(@user['email'],@user['password'])
  dash.wait_for_title
end

Dado(/^acessa o cadastro de clientes$/) do
  customer.load
end

#cadastro de cliente
Dado(/^que eu tenho um novo cliente com os seguintes atributos:$/) do |table|
    @new_customer = table.rows_hash
  end

  Dado(/^esse cliente não está cadastrado no sistema$/) do
    client = Mongo::Client.new($db_connection)
    #mongoDB (NOSQL)
    #Tabelas => collection
    #Registros => documentos
    client[:customers].delete_one(email: @new_customer['email'])
    client.close
  end

  Dado(/^que eu tenho um novo cliente fake do tipo "([^"]*)"$/) do |type|
   data = TestData.new
   @new_customer = data.get_fake_customer
  end
  
  Quando(/^faço o cadastro desse cliente$/) do
    customer.saves(@new_customer)
    sleep(5)
end
  
  Então(/^esse cliente deve ser exibido na lista$/) do
    customer.search_input.set @new_customer['email']
    customer.search_button.click
    expect(customer.has_view?).to eql true
    expect(customer.view.size).to eql 1
    line = customer.view.first.text
    expect(line).to have_content @new_customer['nome']
    expect(line).to have_content @new_customer['telefone']
    expect(line).to have_content @new_customer['email']
end

#delete

Dado(/^que eu tenho um cliente cadastrado$/) do
  steps %{
    Dado que eu tenho um novo cliente fake do tipo "Prime"
    Quando faço o cadastro desse cliente
    Então esse cliente deve ser exibido na lista
  }
end

Quando(/^solicito a exclusão desse cliente$/) do
  customer.delete_first
end

Quando(/^confirmo a ação de exclusão$/) do
  customer.modal.confirm_button.click
end

Então(/^esse cliente não deve ser exibido na busca$/) do
  expect(customer.message_view.text).to eql "\"#{@new_customer['email']}\" não encontrado."
end


Quando(/^cancelo a ação de exclusão$/) do
  customer.modal.cancel_button.click
end

Então(/^esse cliente deve ser exibido na busca$/) do
  expect(customer.view.first.text).to have_content @new_customer['email']
end
 