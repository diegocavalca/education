package com.diegocavalca.simpledatabase;

import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.diegocavalca.simpledatabase.dao.PessoaDAO;
import com.diegocavalca.simpledatabase.modelo.Pessoa;

public class RegisterActivity extends ActionBarActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        Button btnSaveRegister = (Button) findViewById(R.id.btnSaveRegister);
        btnSaveRegister.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Pessoa pData = getDataFields();

                PessoaDAO pDao = new PessoaDAO(RegisterActivity.this);
                pDao.insert(pData);
                pDao.close();

                Toast.makeText(RegisterActivity.this, R.string.new_register_success,Toast.LENGTH_SHORT).show();

                Intent intent = new Intent(RegisterActivity.this, ReportActivity.class);
                startActivity(intent);

            }
        });
    }

    private Pessoa getDataFields(){

        EditText edtName = (EditText) findViewById(R.id.edtName);
        EditText edtEmail = (EditText) findViewById(R.id.edtEmail);
        EditText edtBirth = (EditText) findViewById(R.id.edtBirth);

        Pessoa p = new Pessoa();
        p.setNome(edtName.getText().toString());
        p.setEmail(edtEmail.getText().toString());
        p.setNascimento(edtBirth.getText().toString());

        return p;
    }

}
