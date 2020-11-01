package com.example.courtcounter;
import android.content.Intent;
import android.R.xml;
import android.os.Handler;
import android.os.Bundle;
import com.example.android.courtcounter.R;
//import com.example.counter_flutter.R;
import androidx.appcompat.app.AppCompatActivity;
//import androidx.appcompat.app.AppCompatActivity;
import android.view.WindowManager;

//package com.example.
//import android.os.Bundle;
import io.flutter.embedding.android.FlutterActivity;
public class MainActivity extends AppCompatActivity {


    private static final int SPLASH_SCREEN_TIME_OUT = 4000;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        // Defining the FlutterActivity to display
        // the Flutter UI within this host app.
        startActivity(
                FlutterActivity
                        .withNewEngine()
                        .initialRoute("splashRoute")
                        .build(this)
        );

        new Handler().postDelayed(() -> {

            // This intent will be used to switch to the CounterActivity
            Intent i = new Intent(MainActivity.this,
                    CounterActivity.class);

            // Invoke the CounterActivity
            startActivity(i);

            // The current activity will get finished
            finish();

        }, SPLASH_SCREEN_TIME_OUT);

    }


}