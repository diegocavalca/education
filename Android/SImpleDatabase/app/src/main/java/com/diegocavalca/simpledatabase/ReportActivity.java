package com.diegocavalca.simpledatabase;

import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.diegocavalca.simpledatabase.dao.PessoaDAO;
import com.diegocavalca.simpledatabase.modelo.Pessoa;

import java.util.ArrayList;
import java.util.List;

public class ReportActivity extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_report);
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }

    @Override
    protected void onResume() {
        super.onResume();

        // Arrray de dados, que serão exibidos na ListView...
        //String[] items = {"João da Silva", "Maria Oliveira", "Francisco Aragão"};
        PessoaDAO pDao = new PessoaDAO(this);
        List<Pessoa> items = pDao.searchAll();
        pDao.close();

        // Inicializando o adapter...
        //ArrayAdapter<String> itemsAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, items);
        ArrayAdapter<Pessoa> itemsAdapter = new ArrayAdapter<Pessoa>(this, android.R.layout.simple_list_item_1, items);

        // Instanciando a ListView...
        ListView lv = (ListView) findViewById(R.id.listReport);

        // Definindo o adapter (com os dados) para a ListView...
        lv.setAdapter(itemsAdapter);
    }
}
