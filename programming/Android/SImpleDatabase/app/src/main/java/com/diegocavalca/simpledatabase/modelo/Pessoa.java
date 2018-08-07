package com.diegocavalca.simpledatabase.modelo;

import java.util.Date;

/**
 * Created by Diego on 13/02/2016.
 */
public class Pessoa {
    private int id;
    private String nome;
    private String email;
    private String nascimento;

    @Override
    public String toString() {
        return getNome();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNascimento() {
        return nascimento;
    }

    public void setNascimento(String nascimento) {
        this.nascimento = nascimento;
    }
}
