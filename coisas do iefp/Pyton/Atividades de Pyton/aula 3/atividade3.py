import random


cabaz1 = ["arroz", "feijao", "açucar"]
cabaz2 = ["acucar", "carne", "agua"]
cabaz3 = ["ovos", "macarrao", "acucar"]
randomNumber = random.randint(1, 4)

print("------------- sorteio de natal-----------")

if randomNumber == 1:
    print(f"voce gannhou o cabaz 1:{cabaz1[1]}")
elif randomNumber == 2:
    print(f"voce ganhou o cabaz 2: {cabaz2[1]}")
elif randomNumber == 3:
    print(f"voce ganhou o cabaz 3:{cabaz3[1]} ")
elif randomNumber == 4:
    print("voce nao ganhou")
else:
    print("erro")
