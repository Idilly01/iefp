instituicaoNome = input("Qual é o nome da instituição?")
instituicaoMorada = input("Qual é a morada?")

dadosPessoaisNome = input("Qual é o seu nome?")
dadosPessoaisMorada= input("Qual é a sua morada?")
dadosPessoaisNIF = input("Qual é o seu NIF?")

dadosEscolaresAno = input("Em que ano você esta?")
dadosEscolaresNumeroAluno = input("Qual é o seu numero de aluno")
dadosEscolaresCurso = ("Qual curso você frequenta?")


print(f"""
    {instituicaoNome}
Morada: {instituicaoMorada}
-----------------------------

Nome: {dadosPessoaisNome}
NIF: {dadosPessoaisNIF}
Morada: {dadosPessoaisMorada}

Curso: {dadosEscolaresCurso}
Nº de aluno: {dadosEscolaresNumeroAluno}
Ano a frequentar: {dadosEscolaresAno}


____________________________________
            assinatura
      """)

