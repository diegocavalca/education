package com.diegocavalca.agenda;

import android.app.Activity;
import android.os.Bundle;

import modelo.Pessoa;

/**
 * Created by Diego on 11/08/2015.
 */
public class Cadastro extends Activity{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.cadastro);

        // Definir o Helper...
        CadastroHelper helper = new CadastroHelper();

        // Capturar clique do botão gravar...

        // Capturar informações fornecidas no preenchimento do novo contato..
        Pessoa p = helper.getCadastro();

        //Instanciar classe DAO...
        // Chamar método SALVAR(PESSOA)
        // Fechar conexão...

    }
}
