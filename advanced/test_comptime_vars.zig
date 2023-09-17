const std = @import("std");
const expect = std.testing.expect;

test "comptime vars" {
    std.testing.log_level = .info;
    comptime var x: i32 = 1;
    var y: i32 = 1;

    x += 1;
    y += 1;

    try expect(x == 2);
    try expect(y == 2);

    if (x != 2) {
        // コンパイル時に x が 2 に決定されているので通らない
        @compileError("x compile error");
    }
    if (y != 2) {
        // コンパイル時に y が 2 に決定されていないので通る
        @compileError("y compile error");
    }
}