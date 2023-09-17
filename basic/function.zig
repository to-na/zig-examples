const std = @import("std");

// 結果を返す
fn add(a: i32, b: i32) i32 {
    return a + b;
}

// void を指定すると結果を返さない
fn printHello() void {
    std.debug.print("Hello!\n", .{});
}

pub fn main() void {
    const sum = add(1, 2);
    std.debug.print("sum: {}\n", .{sum}); // sum: 3
    printHello(); // Hello!
}
