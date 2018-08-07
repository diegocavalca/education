package com.diegocavalca.agenda;

import android.os.Bundle;
import android.widget.EditText;

import modelo.Pessoa;

/**
 * Created by Diego on 11/08/2015.
 */
public class CadastroHelper{

    private EditText editNome;
    private EditText editTelefone;
    private EditText editEmail;

    public CadastroHelper(Cadastro cadastro){


        editNome = (EditText) cadastro.findViewById(R.id.cadastro_nome);
        editTelefone = (EditText) cadastro.findViewById(R.id.cadastro_nome);
        editEmail = (EditText) cadastro.findViewById(R.id.cadastro_nome);

    }


    public Pessoa getCadastro() {

        Pessoa pessoa = new Pessoa();

        pessoa.setNome(editNome.getText().toString());
        pessoa.setTelefone(editTelefone.getText().toString());
        pessoa.setEmail(editEmail.getText().toString());

        return pessoa;
    }
}
