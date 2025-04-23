#FUNÇÕES EM PYTHON

#2.1 CRIAR FUNCOES SEM PARAMETROS
def saudacao():
    print("ola bem vindo")

saudacao()




#2.2 CRIAR FUNCOES COM PARAMETROS

def apresentar(nome, idade):
    print(f"O aluno {nome} tem {idade} anos")

apresentar("carlos", 21)


#2.3 FUNCAO COM RETORNO DE VALOR


def soma(a,b):
    return a +b

resultado = soma(5,3)
print(resultado)


#2.4 USAR FUNCOES COM DICIONARIOS

def criarAluno(nome, idade, curso):
    return {"nome": nome, "idade": idade, "curso":curso}

alunoNovo = criarAluno("Ana", 22, "Matematica")
print(alunoNovo)