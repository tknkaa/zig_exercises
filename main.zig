const std = @import("std");

pub fn main() !void {
    var stdin_buf: [1024]u8 = undefined;
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buf);
    const stdin: *std.io.Reader = &stdin_reader.interface;

    const bare_line = try stdin.takeDelimiter('\n') orelse unreachable;

    std.debug.print("{any}", .{bare_line});
}
