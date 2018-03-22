
/* library */
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import ddf.minim.*;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;


/* game arrays */
//オブジェクト管理
//test
Slime gray;

/* system */
int WIDTH;
int HEIGHT;
KeyState keyState;

/* materials */
//icon配列
Map<String, PImage[]> icons;
//layer
Map<String, PGraphics> layers;
Map<String, Float> layerDepth;

//sound
Minim minim;
Map<String, AudioPlayer> sounds;


void setup() {
  size(960, 540, P2D);
  WIDTH = width;
  HEIGHT = height;
  
  frameRate(30f);
  
  icons = new HashMap<String, PImage[]>();
  icons.put("SLIME", sliceImage("slime2.png", 32, 32));
  icons.put("SLIME_RIGHT", sliceImage("slime2.png", 32, 32, 2, 2));
  icons.put("SLIME_LEFT", sliceImage("slime2.png", 32, 32, -2, 2));
  icons.put("SLIME_DOWN", sliceImage("slime_b.png", 32, 32, 2, 2));
  icons.put("SLIME_UP", sliceImage("slime_b.png", 32, 32, 2, -2));
  icons.put("SLIME_YELLOW", sliceImage("slime.png", 32, 32));
  
  layers = new HashMap<String, PGraphics>();
  layerDepth = new HashMap<String, Float>();
  layers.put("UI", createGraphics(WIDTH, HEIGHT));
  layerDepth.put("UI", -1.);
  layers.put("BACK", createGraphics(WIDTH, HEIGHT));
  layerDepth.put("BACK", 1.);
  layers.put("MAIN", createGraphics(WIDTH, HEIGHT));
  layerDepth.put("MAIN", .0);
  
  keyState = new KeyState();
  
  //test
  gray = new Slime();
}