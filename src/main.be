mod {
    use std.game.Block.PlaceBlock;
    use canvas.Canvas;

    def julia_set = JuliaSet { c: 0.5 + 0.5i, iterations: 10 };

    pub def main: () -> () \ PlaceBlock = Canvas {
        initial: (0, 0),
        end: (200, 100),
        height: 0,
        color: julia_set.color
    }.draw ();
}
