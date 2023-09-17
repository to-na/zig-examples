const std = @import("std");
const assert = std.debug.assert;

// 各スレッド内でローカルとして扱われる
threadlocal var x: i32 = 1234;

test "thread local storage" {
    const thread1 = try std.Thread.spawn(.{}, testTls, .{}); // run on new thread
    const thread2 = try std.Thread.spawn(.{}, testTls, .{}); // run on new thread
    testTls(); // run on main thread
    thread1.join();
    thread2.join();
}

fn testTls() void {
    assert(x == 1234);
    x += 1;
    assert(x == 1235);
}