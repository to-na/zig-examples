const cStdio = @cImport({
    @cInclude("stdio.h");
});

pub fn main() void {
    _ = cStdio.printf("Hello from C!\n");
}