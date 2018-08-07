package com.diegocavalca.simpledatabase.dao;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;

import com.diegocavalca.simpledatabase.modelo.Pessoa;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Diego on 13/02/2016.
 */
public class PessoaDAO {

    private SQLiteDatabase db;
    private DbHelper dbHelper;

    // Columns table
    private String[] columns = {DbContract.Pessoa.COLUMN_NAME_PESSOA_ID,
                                DbContract.Pessoa.COLUMN_NAME_NOME,
                                DbContract.Pessoa.COLUMN_NAME_EMAIL,
                                DbContract.Pessoa.COLUMN_NAME_NASCIMENTO};

    public PessoaDAO(Context context) {
        dbHelper = new DbHelper(context);
        db = dbHelper.getWritableDatabase();
    }

    public void close() {
        dbHelper.close();
    }

    public long insert(Pessoa pValue) {
        ContentValues values = new ContentValues();

        //Carregar os valores nos campos da entidade que será incluído
        values.put(DbContract.Pessoa.COLUMN_NAME_NOME, pValue.getNome());
        values.put(DbContract.Pessoa.COLUMN_NAME_EMAIL, pValue.getEmail());
        values.put(DbContract.Pessoa.COLUMN_NAME_NASCIMENTO, pValue.getNascimento());

        return db.insert(DbContract.Pessoa.TABLE_NAME, null, values);
    }

    public int update(Pessoa pValue) {
        long id = pValue.getId();
        ContentValues values = new ContentValues();

        //Carregar os novos valores nos campos que serão alterados
        values.put(DbContract.Pessoa.COLUMN_NAME_NOME, pValue.getNome());
        values.put(DbContract.Pessoa.COLUMN_NAME_EMAIL, pValue.getEmail());
        values.put(DbContract.Pessoa.COLUMN_NAME_NASCIMENTO, pValue.getNascimento());

        //Alterar o registro com base no ID
        return db.update(DbContract.Pessoa.TABLE_NAME, values, DbContract.Pessoa.COLUMN_NAME_PESSOA_ID + " = " + id, null);
    }

    public void Excluir(Pessoa pValue) {
        long id = pValue.getId();

        //Exclui o registro com base no ID
        db.delete(DbContract.Pessoa.TABLE_NAME, DbContract.Pessoa.COLUMN_NAME_PESSOA_ID + " = " + id, null);
    }

    public List<Pessoa> searchAll() {
        List<Pessoa> registers = new ArrayList<Pessoa>();

        //Consulta para trazer todos os dados da tabela Agenda ordenados pela coluna Nome
        Cursor cursor = db.query(DbContract.Pessoa.TABLE_NAME, columns, null, null, null, null, null);
        //Cursor cursor = db.query(DbContract.Pessoa.TABLE_NAME, columns, null, null, null, null, DbContract.Pessoa.COLUMN_NAME_NOME);

        cursor.moveToFirst();
        while (!cursor.isAfterLast()) {
            Pessoa r = cursorToRegister(cursor);
            registers.add(r);
            cursor.moveToNext();
        }

        //Tenha certeza que você fechou o cursor
        cursor.close();
        return registers;
    }

    //Converter o Cursor de dados no objeto POJO ContatoVO
    private Pessoa cursorToRegister(Cursor cursor) {
        Pessoa register = new Pessoa();
        register.setId(cursor.getInt(0));
        register.setNome(cursor.getString(1));
        register.setEmail(cursor.getString(2));
        register.setNascimento(cursor.getString(3));
        return register;
    }
}