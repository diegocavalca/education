package com.diegocavalca.simpledatabase.dao;

import android.provider.BaseColumns;

/**
 * Created by Diego on 13/02/2016.
 */
public class DbContract {

    /**
     * Essa classe define o schema do banco de dados.
     * Uma classe de contrato é o contêiner das constantes que definem nomes para URIs, tabelas e colunas.
     * A classe de contrato permite usar as mesmas constantes em outras classes no mesmo pacote.
     * Permite que você altere o nome da coluna em um local e que a mudança se propague pelos seus códigos.
     */
    public DbContract(){}

    /* Inner class that defines the table contents - Pessoa */
    public static abstract class Pessoa implements BaseColumns {
        public static final String TABLE_NAME = "pessoa";
        public static final String COLUMN_NAME_PESSOA_ID = "id";
        public static final String COLUMN_NAME_NOME = "nome";
        public static final String COLUMN_NAME_EMAIL = "email";
        public static final String COLUMN_NAME_NASCIMENTO = "nascimento";
    }


}
