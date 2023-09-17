const std = @import("std");

// !f32 は Error Union Type
fn divide(a: f32, b: f32) !f32 {
    if (b == 0) return error.DivisionByZero;
    return a / b;
}

test "Division By 2" {
    const result = try divide(10, 2);
    try std.testing.expect(result == 5);
}

test "Division By 0" {
    try std.testing.expectError(error.DivisionByZero, divide(10, 0));
}