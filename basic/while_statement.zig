const std = @import("std");

pub fn main() void {
    var count: i32 = 0;
    while (count < 5) : (count += 1) {
        std.debug.print("Count: {}\n", .{count}); // Count: 0, ..
    }
}
