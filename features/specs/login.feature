            #language: pt

Funcionalidade: Login
Sendo um usuario do sistema Invoice
Posso acessar minha conta
Para poder cadastrar meus clientes e também lançar faturas

@login @logout
Cenário: Admin faz login

    Dado que tenho um usuário com perfil "admin"
    Quando faço login
    Então vejo o dashboard com a mensagem "Olá," usuário ", seja bem vindo ao Invoices."
        E vejo o email do usuário logado no menu superior

@tentativa_login
Esquema do Cenário: Tentativa de login

    Dado que tenho o usuário <email> e senha <senha>
    Quando faço login
    Então vejo a <mensagem> de erro de autenticação

    Exemplos:
    |email|senha|mensagem|
    |"admin-qa@ninvoices.com"|"test123"|"Senha inválida."|
    |"usuarionaoexiste@ninvoices.com"|"secret"|"Usuário não cadastrado."|
    |"emailinvalido&ninvoices.com"|"secret"|"Informe um email válido."|