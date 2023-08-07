mod {
    use std.fn.id;
    use std.math;
    use math.Complex;
    use std.game.Block.blocks;

    pub def JuliaSet = struct {
        item c: Complex;
        item iterations: Int32;

        def escape_iteration = z: Complex |-> region {
            mut z = z;

            for iteration in 0..iterations {
                if math.abs(z) > 2.0 then break iteration;
                z = math.square(z) + c;
            }

            break iterations;
        } with id;

        // FIXME: This is really bad, and should be reworked
        def color = z: (Fixed, Fixed) |-> match escape_iteration (Complex.from z) {
            0 -> blocks.RED_CONCRETE,
            1 -> blocks.ORANGE_CONCRETE,
            2 -> blocks.YELLOW_CONCRETE,
            3 -> blocks.LIME_CONCRETE,
            4 -> blocks.GREEN_CONCRETE,
            5 -> blocks.CYAN_CONCRETE,
            6 -> blocks.LIGHT_BLUE_CONCRETE,
            7 -> blocks.BLUE_CONCRETE,
            8 -> blocks.PURPLE_CONCRETE,
            9 -> blocks.GRAY_CONCRETE,
            _ -> blocks.BLACK_CONCRETE,
        };
    };
}
