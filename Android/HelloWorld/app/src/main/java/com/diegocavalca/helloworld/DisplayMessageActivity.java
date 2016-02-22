package com.diegocavalca.helloworld;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class DisplayMessageActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_message);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        // Receiving Intent with parameter
        Intent intent = getIntent();
        // Getting extra value transmitted...
        String message = intent.getStringExtra(HelloWorldActivity.EXTRA_MESSAGE);

        // Creating element Textview (container of message - EXTRA_VALUE transmitted)
        TextView textView = new TextView(this);
        textView.setTextSize(40);
        textView.setText(message);

        // Setting textview in layout screen...
        RelativeLayout layout = (RelativeLayout) findViewById(R.id.content);
        layout.addView(textView);



    }

}
