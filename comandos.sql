--Inserir novo colaborador

INSERT INTO brh.colaborador (MATRICULA, CPF, NOME, SALARIO, LOGRADOURO, COMPLEMENTO_ENDERECO, CEP, DEPARTAMENTO) 
VALUES ('A124','123.456.789-10', 'Fulano de Tal', '12345', 'Rua 12 de Outubro, 12', 'CASA12', '71111-100', 'DEPTI');

INSERT INTO brh.telefone_colaborador (numero, tipo, colaborador) VALUES ('(61) 9 9999-9999','M', 'A124');
INSERT INTO brh.telefone_colaborador (numero, tipo, colaborador) VALUES ('(61) 3030-4040','R', 'A124');
INSERT INTO brh.email_colaborador (colaborador, email, tipo) VALUES ('A124', ' fulano@email.com', 'P');
INSERT INTO brh.email_colaborador (colaborador, email, tipo) VALUES ('A124', ' fulano.tal@brh.com', 'T');

INSERT INTO brh.dependente (cpf, colaborador, nome, parentesco, data_nascimento) 
VALUES ('123.456.789-10', 'A124', 'Beltrana de Tal', 'Filho(a)', to_date('2000-01-01', 'yyyy-mm-dd'));

INSERT INTO brh.dependente (cpf, colaborador, nome, parentesco, data_nascimento) 
VALUES ('455.788.598-25', 'A124', 'Cicrana de Tal', 'Cônjuge', to_date('1990-06-07', 'yyyy-mm-dd'));

SELECT * FROM brh.dependente WHERE colaborador = 'A124';

UPDATE brh.dependente set (cpf) = '987.456.321-00' WHERE cpf = '123.456.789-10';


--Relatorio de Conjuges

SELECT COLABORADOR AS MATRICULA_COLABORADOR, NOME, TO_CHAR (DATA_NASCIMENTO, 'dd/mm/yyyy')
FROM BRH.DEPENDENTE 
WHERE PARENTESCO = 'Cônjuge';

--Relatorio contato telefônicos

SELECT COLABORADOR, NUMERO FROM BRH.TELEFONE_COLABORADOR WHERE TIPO IN ('M', 'C') ORDER BY COLABORADOR, NUMERO;

--Colaborador com maior salário

SELECT MAX(SALARIO) FROM BRH.COLABORADOR;

SELECT NOME, SALARIO 
FROM BRH.COLABORADOR 
WHERE SALARIO = (SELECT MAX(SALARIO)FROM BRH.COLABORADOR);

--Relatorio de Senioridade
    
SELECT MATRICULA, NOME, SALARIO, 
    CASE 
        WHEN SALARIO <= 3000 THEN 'Junior'
        WHEN SALARIO <= 6000 THEN 'Pleno'
        WHEN SALARIO <= 20000 THEN 'Senior'
        ELSE 'Corpo Diretor'
    END SENIORIDADE
FROM BRH.COLABORADOR
ORDER BY SENIORIDADE, NOME;

COMMIT;
