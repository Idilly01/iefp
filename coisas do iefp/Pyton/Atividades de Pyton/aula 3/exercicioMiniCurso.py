#inicio mini curso 
#mes = "Março"
#vendas = 1000
#despesas = 500

#lucro = vendas - despesas
#print("O Lucro do mes de março é de " + mes + "é do valor de " + str(lucro) + "€")

#

#USER INPUT

#vendas = float(input("Qual é o valor das vendas?  "))
#despesas = float(input("Qual é o valor das despesas? "))
#mes = input("Qual é o mês?")
#resultadoMes = vendas - despesas

#70print(resultadoMes)

#if resultadoMes > 0: 
#    print("O resultado do mes" + mes + "é de:" + str(resultadoMes) + ". Pelo que teve lucro")
#elif resultadoMes == 0:
#    print("O resultado do mes" + mes + "é de: " + str(resultadoMes) + ". Pelo que não teve lucro nem prejuizo.")
#else:
#    print("O resultado do mês de: " + mes + " é de: " + str(resultadoMes) + ". Pelo que teve prejuizo.")    



#LISTAS DE PRODUTOS(APPEND, INSERT, REMOVE, POP)

listaProdutos = ["websites", "consultoria"]
print(listaProdutos)

listaProdutos.append("formacao")
print(listaProdutos)

listaProdutos.pop()
print(listaProdutos)


listaProdutos.insert(0, "formação")
print(listaProdutos)

listaProdutos.remove("websites")
print(listaProdutos)

listaProdutos.append("formacao")
print(listaProdutos)


#ciclo for
for produto in listaProdutos:
    print(produto)


#while
contagem = 10
while contagem >=0:
    print(contagem)
    contagem -=1
print("terminamos a aula")