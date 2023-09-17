const std = @import("std");

test "memory allocation" {
    const allocator = std.heap.page_allocator;
    const buffer = try allocator.alloc(u8, 128);
    defer allocator.free(buffer);
    // u8 型のメモリが 128 バイト分確保されている
    try std.testing.expect(@TypeOf(buffer) == []u8);
    try std.testing.expect(buffer.len == 128);
}