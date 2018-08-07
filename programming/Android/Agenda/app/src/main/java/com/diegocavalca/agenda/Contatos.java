package com.diegocavalca.agenda;

import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;

import java.util.zip.Inflater;


public class Contatos extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.contatos);

        // Instanciar DAO...
        // Chamar método Selecionar Todos...
        //Fechar conex DAO...

        // Instanciar Array Adapter

        // Carregar Listview...

        // Evntos de cliques nos item do ListView...
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater inflater = getMenuInflater();
        inflater.inflate(R.menu.menu_contatos, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {

        int itemMenuClicado = item.getItemId();

        switch(itemMenuClicado){
            case R.id.item_novo:
                break;
            default:
                break;
        }

        return super.onOptionsItemSelected(item);
    }
}
