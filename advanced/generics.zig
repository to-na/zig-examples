const std = @import("std");

fn max(comptime T: type, a: T, b: T) T {
    if (a > b) return a;
    return b;
}

pub fn main() void {
    const result = max(i32, 10, 20);
    std.debug.print("Result: {}\n", .{result}); // Number: 1, ..
}
// TODO: add test