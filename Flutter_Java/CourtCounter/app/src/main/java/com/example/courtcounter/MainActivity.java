package com.example.courtcounter;
import android.content.Intent;
import android.R.xml;
import android.os.Handler;
import android.os.Bundle;
import com.example.android.courtcounter.R;
import com.google.ar.core.AugmentedFace;
import com.google.ar.core.Frame;
import com.google.ar.sceneform.rendering.ModelRenderable;
import com.google.ar.sceneform.rendering.Renderable;
import com.google.ar.sceneform.rendering.Texture;
import com.google.ar.sceneform.ux.AugmentedFaceNode;
//import com.example.counter_flutter.R;
import androidx.appcompat.app.AppCompatActivity;
//import androidx.appcompat.app.AppCompatActivity;
import android.view.WindowManager;

//package com.example.
//import android.os.Bundle;
import java.util.Collection;

import io.flutter.embedding.android.FlutterActivity;
public class MainActivity extends AppCompatActivity {

private ModelRenderable modelRenderable;
private Texture texture;

    private boolean isAdded = false;
    private static final int SPLASH_SCREEN_TIME_OUT = 54000;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


CustomArFragment customerArFragment = (CustomArFragment) getSupportFragmentManager()
        .findFragmentById(R.id.arFragment);

ModelRenderable.builder()
        .setSource(this,R.raw.fox_face)
        .build()
        .thenAccept(renderable1 ->{
            modelRenderable = renderable1;
            modelRenderable.setShadowCaster(false);
            modelRenderable.setShadowReceiver(false);
        } );
Texture.builder()
        .setSource(this,R.drawable.fox_face_mesh_texture)
        .build()
        .thenAccept(texture-> this.texture = texture);
customerArFragment.getArSceneView()
.setCameraStreamRenderPriority(Renderable.RENDER_PRIORITY_FIRST);
customerArFragment.getArSceneView().getScene().addOnUpdateListener(frameTime -> {
    if(modelRenderable == null || texture == null)
        return;
    Frame frame = customerArFragment.getArSceneView().getArFrame();

    Collection<AugmentedFace> augmentedFaces = frame.getUpdatedTrackables(AugmentedFace.class);
    for(AugmentedFace augmentedFace : augmentedFaces)
    {
        if(isAdded){
            return;
        }
        AugmentedFaceNode augmentedFaceNode = new AugmentedFaceNode((augmentedFace));
        augmentedFaceNode.setParent(customerArFragment.getArSceneView().getScene());
        augmentedFaceNode.setFaceRegionsRenderable(modelRenderable);
    augmentedFaceNode.setFaceMeshTexture(texture);
        isAdded = true;
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