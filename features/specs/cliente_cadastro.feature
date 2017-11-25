            #language:pt

Funcionalidade: Cadastrar clientes
Sendo um usuário cadastrado
Posso acessar a página clientes
Para cadastrar meus clientes e lançar faturas

Contexto: Usuário logado acessa o cadastro de clientes
    * usuário "admin" deve estar logado
    * acessa o cadastro de clientes

            @cad_cliente
Cenário: Cadastrar novo cliente
Dado que eu tenho um novo cliente com os seguintes atributos:
            | nome     | Isadora Giongo                    |
            | telefone | 9999-9990                         |
            | email    | isagiongo@gmail.com               |
            | sexo     | F                                 |
            | tipo     | Platinum                          |
            | obs      | Cliente solicitou cadastro        |
            | info     | true                              |
E esse cliente não está cadastrado no sistema            
            Quando faço o cadastro desse cliente
            Então esse cliente deve ser exibido na lista

@cad_cliente_fake
Cenário: Cadastrar novo cliente fake

Dado que eu tenho um novo cliente fake do tipo "Prime"
Quando faço o cadastro desse cliente
Então esse cliente deve ser exibido na lista