class Item extends Article {
  private boolean isRemove;
  private float removingTime;
  private final float removeDelay = 0.5f;
  private float growthTime;
  private final float ripeTime = 4f;
  
  Item() {
    r = new PVector(random(1f), 0f);
    r.rotate(random(TAU));
    r.x *= WIDTH;
    r.y *= HEIGHT;
    r.div(3f).add(WIDTH * .5f, HEIGHT * .6f);
    
    size = 32f;
    isRemove = false;
    removingTime = growthTime = 0f;
  }
  
  void Draw() {
    PGraphics pg = layers.get("MAIN");
    pgOpen(pg,r);
      pg.image(getImage(), 0, 0);
    pgClose(pg);
  }
  
  private PImage getImage() {
    PImage[] tiles = icons.get("ITEM");
    return tiles[getFrame(tiles.length)];
  }
  
  private int getFrame(int frames) {
    return int((frames - 1) * min(1f, growthTime / ripeTime));
  }
  
  private int getGrowth() {
    return getFrame((icons.get("ITEM")).length) + 1;
  }
  
  void Update() {
    super.Update();
    if(!isRemove) growthTime += 1f / frameRate;
    if(isRemove) removingTime += 1f / frameRate;
  }
  
  boolean isCollide(Article temp) {
    if(temp instanceof Slime == false) return false;
    if(getGrowth() <= 1) return false;
    if(dist(r, (new PVector(0f, size / 3f)).add(temp.r)) < size) {
      return super.isCollide(temp);
    }
    return false;
  }
  
  void collide(Article temp) {
    //one time
    if(temp instanceof Slime) {
      if(isRemove == false) {
          ((Slime)temp).setEating();
          ((Slime)temp).addEnergy(getGrowth() * .5f);
          v.add(temp.r).sub(r).mult(removeDelay);
      }
    }
    
    isRemove = true;
  }
  
  boolean isRemove() {
    return (removingTime >= removeDelay) && isRemove;
  }
}