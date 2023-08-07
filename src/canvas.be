mod {
    use std.math.interpolate;
    use std.game.Pos;
    use std.game.Block;
    use Block.PlaceBlock;

    pub def Canvas = struct {
        item initial: (Int32, Int32);
        item end: (Int32, Int32);
        item height: Int32;
        
        item color: (Fixed, Fixed) -> Block;

        def draw: () -> () \ PlaceBlock = () |-> region {
            for x in initial.0.end.0 {
                for z in initial.1.end.1 {
                    break {
                        block: color (
                            interpolate { value: x, between: (initial.0, end.0) },
                            interpolate { value: x, between: (initial.1, end.1) }
                        ),
                        pos: Pos (x, height, z)
                    };
                }
            }
        };
    };
}
