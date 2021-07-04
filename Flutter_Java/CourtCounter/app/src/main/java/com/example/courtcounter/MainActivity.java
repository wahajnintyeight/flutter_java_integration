package com.example.courtcounter;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.R.xml;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Bundle;
import io.flutter.embedding.engine.FlutterEngine;
import com.example.android.courtcounter.R;
import com.google.ar.core.AugmentedFace;
import com.google.ar.core.Frame;
import com.google.ar.sceneform.math.Vector3;
import com.google.ar.sceneform.rendering.ModelRenderable;
import com.google.ar.sceneform.rendering.Renderable;
import com.google.ar.sceneform.rendering.Texture;
import com.google.ar.sceneform.ux.ArFragment;
import com.google.ar.sceneform.ux.AugmentedFaceNode;
//import com.example.counter_flutter.R;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
//import androidx.appcompat.app.AppCompatActivity;
import android.view.WindowManager;

//package com.example.
//import android.os.Bundle;
import java.util.Collection;

import io.flutter.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends anotherOne {


    private ModelRenderable modelRenderable;
    private Texture texture;
    Boolean isadded = false;
    private ArFragment arFragment;
    private boolean isAdded = false;
    private static final int SPLASH_SCREEN_TIME_OUT = 54000;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
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



        setContentView(R.layout.activity_main);

        CustomArFragment arFragment = (CustomArFragment) getSupportFragmentManager().findFragmentById(R.id.arFragment);
        ModelRenderable.builder()
                .setSource(this, R.raw.ringearrings)
                .build()
                .thenAccept(modelRenderable -> {
                    this.modelRenderable = modelRenderable;
                    this.modelRenderable.setShadowCaster(false);
                    this.modelRenderable.setShadowReceiver(false);
                });
        Texture.builder()
                .setSource(this, R.drawable.mask)
                .build()
                .thenAccept(texture -> {
                    this.texture = texture;
                });

        arFragment.getArSceneView().setCameraStreamRenderPriority(Renderable.RENDER_PRIORITY_FIRST);
        arFragment.getArSceneView().getScene().addOnUpdateListener(frameTime -> {
            if (modelRenderable == null || texture == null)
                return;

            Frame frame = arFragment.getArSceneView().getArFrame();
            Collection<AugmentedFace> augmentedFaces = frame.getUpdatedTrackables(AugmentedFace.class);
            for (AugmentedFace augmentedFace : augmentedFaces) {
                if (isadded)
                    return;

                AugmentedFaceNode augmentedFaceNode = new AugmentedFaceNode(augmentedFace);
                augmentedFaceNode.setParent(arFragment.getArSceneView().getScene());
                augmentedFaceNode.setFaceRegionsRenderable(modelRenderable);
                // augmentedFace.getRegionPose(AugmentedFace.RegionType.NOSE_TIP);
                // augmentedFace.getCenterPose();
                augmentedFaceNode.setFaceMeshTexture(texture);
                augmentedFaceNode.setWorldScale(new Vector3(1.25f, 1.25f, 1.25f));

                isadded = true;

            }
        });


        //DO NOT MESS WITH THIS
//        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
//                WindowManager.LayoutParams.FLAG_FULLSCREEN);
//
//        // Defining the FlutterActivity to display
//        // the Flutter UI within this host app.
//        startActivity(
//                FlutterActivity
//                        .withNewEngine()
//                        .initialRoute("splashRoute")
//                        .build(this)
//        );
//
//        new Handler().postDelayed(() -> {
//
//            // This intent will be used to switch to the CounterActivity
//            Intent i = new Intent(MainActivity.this,
//                    CounterActivity.class);
//
//            // Invoke the CounterActivity
//            startActivity(i);
//
//            // The current activity will get finished
//            finish();
//
//        }, SPLASH_SCREEN_TIME_OUT);

    }


}