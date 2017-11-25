#encoding: utf-8

Dado(/^que tenho um usuário com perfil "([^"]*)"$/) do |profile|                              
  @user = $data['users'][profile]
end                                                                                        
                                                                                                                                                                                                                                                              

Dado(/^que tenho o usuário "([^"]*)" e senha "([^"]*)"$/) do |email, password|    
  @user = {
    'email' => email,
    'password' => password
  }
end

Quando(/^faço login$/) do
  login.load  
  login.do_login(@user['email'],@user['password'])
end

Então(/^vejo o dashboard com a mensagem "([^"]*)" usuário "([^"]*)"$/) do |hello, msg|     
  expect(dash.title.text).to eql 'Dashboard'
  message = "#{hello} #{@user['name']}#{msg}"
  expect(dash.welcome_message.text).to have_content message
  sleep(5)
end  
                                                                             
Então(/^vejo o email do usuário logado no menu superior$/) do                
  expect(dash.nav.user_menu.text).to eql @user['email']
end                                                                                                                                                     
                                                                                                                                           
Então(/^vejo a "([^"]*)" de erro de autenticação$/) do |message|                
  expect(login.alert.text).to eql message
  sleep(2)
end                                                                          
                                                                             
                                                                        