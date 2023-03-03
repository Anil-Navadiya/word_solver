import 'package:flame/components.dart';

class Character extends SpriteComponent with HasGameRef{
  Vector2 moveDirectional = Vector2.zero();

  double speed = 300;

  Character({
    Sprite? sprite,
    Vector2? positions,
    Vector2? size,
  }) : super(sprite: sprite, position: positions, size: size);

  // @override
  // void update(double dt) {
  //   final gameScreenSize = gameRef.size;
  //
  //   // TODO: implement update
  //   super.update(dt);
  //   this.position += moveDirectional.normalized() * speed * dt;
  //
  //   this.position.clamp(Vector2.zero() - this.size / 2,gameScreenSize - this.size / 2);
  // } //Use For Updating Position

  // void setMoveDirectional(Vector2 newMoveDirectional) {
  //   moveDirectional = newMoveDirectional;
  // }
}
