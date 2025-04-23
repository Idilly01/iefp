import random



print("--------- MAGIC 8 BALL----------")
nome = input("Qual é o seu nome? ")
pergunta = input("Qual é a sua pergunta? ")



print("----------------------------------------\n")
print(f"""Olá, {nome}!
sua pergunta foi: {pergunta}:
       """)
randomNumber = random.randint(1, 9)

if randomNumber == 1:
    print("SIM, definitivamente!")
elif randomNumber == 2:
    print("É decididamente sim")
elif randomNumber == 3:
    print("Sem duvidas")
elif randomNumber == 4:
    print("Te põe no teu lugar mona, é obvio que não")
elif randomNumber == 5:
    print("Que babadoo, tenho certeza que sim!")
elif randomNumber == 6:
    print("Melhor eu nao te dizer isso agora")
elif randomNumber == 7:
    print("Minhas fontes disseram que não")
elif randomNumber == 8:
    print("Definitivamente não")
elif randomNumber == 9:
    print("Isto certamente é muito duvidoso!")
else: 
    print("ERROR 404 ....Pane no sistema!! ")


print("\n-------------- FIM -----------------")



