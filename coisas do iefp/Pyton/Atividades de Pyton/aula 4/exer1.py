alunos = {
    "nome": "Carlos Silva",
    "idade":21,
    "curso": "ciencias da computação"

}
print(alunos)

print(alunos["nome"])
print(alunos["curso"])
print(alunos["idade"])


alunos["idade"]=22
alunos["nota"]=18

print(alunos)

alunos.pop("curso")
print(alunos)

alunos.popitem()
print(alunos)

alunos.clear()
print(alunos)


