#language: pt

Funcionalidade: Remover cliente
Sendo um usuário cadastrado
Posso acessar o cadastro de clientes
Para remover um cliente

Contexto: Usuário logado acessa o cadastro de clientes
    * usuário "admin" deve estar logado
    * acessa o cadastro de clientes

@smoke @logout
Cenário: Remover um cliente

    Dado que eu tenho um cliente cadastrado
    Quando solicito a exclusão desse cliente
        E confirmo a ação de exclusão
    Então esse cliente não deve ser exibido na busca

@smoke @logout
Cenário: Desistência de exclusão

    Dado que eu tenho um cliente cadastrado
    Quando solicito a exclusão desse cliente
        E cancelo a ação de exclusão
    Então esse cliente deve ser exibido na busca

@doing @logout
Cenário: Cliente possui fatura

    Dado que eu tenho um cliente que possui fatura(s)
    Quando solicito a exclusão desse cliente
    Então deve ser exibida a seguinte mensagem:
    """"
    Cliente não pode ser removido, pois possui fatura(s).
    """"