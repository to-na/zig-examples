const std = @import("std");

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer std.process.argsFree(allocator, args);

    if (args.len < 2) {
        std.debug.print("invalid usage", .{});
        return;
    }

    const file = try std.fs.cwd().openFile(args[1], .{});
    defer file.close();
    
    var count: u64 = 0;
    var buf: [4096]u8 = undefined;
    while (true) {
        const bytesRead = try file.read(buf[0..]);
        if (bytesRead == 0) break;
        
        for (buf[0..bytesRead]) |byte| {
            if (byte == '\n') count += 1;
        }
    }

    std.debug.print("Line count: {}\n", .{count});
}