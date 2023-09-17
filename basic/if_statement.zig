const std = @import("std");

pub fn main() void {
    const number = 16;
    if (number * 2 == 32) {
        std.debug.print("The number is 32\n", .{});
    }
}
