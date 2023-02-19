const std = @import("std");
const string = []const u8;

pub fn WriteR(content: string) !string {
    const ts = std.time.timestamp();
    const fileName = std.fmt.allocPrint(std.heap.page_allocator, "test{}.txt", .{ts});
    const flags = std.fs.File.CreateFlags{};
    try std.fs.cwd().createFile(fileName, flags);

    const file = try std.fs.cwd().openFile(fileName, .{});
    // write to file
    _ = try file.writeAll(content);
    defer file.close();
}

pub fn does_file_exist(fpath: string) !bool {
    const file = std.fs.cwd().openFile(fpath, .{}) catch |e| switch (e) {
        error.FileNotFound => return false,
        else => |ee| return ee,
    };
    defer file.close();
    const s = try file.stat();
    if (s.kind != .File) {
        return false;
    }
    return true;
}

pub fn Write(content: string) !void {
    const fileName = "test.txt";
    // const flags = std.fs.File.CreateFlags{
    //     .exclusive = true,
    // };

    // catch PathAlreadyExists error
    // _ = try std.fs.cwd().createFile(fileName, flags);
    

    const file = try std.fs.cwd().openFile(fileName, .{
        .mode = .read_write
    });
    
    const stat = try file.stat();
    try file.seekTo(stat.size);
    // write to file
    _ = try file.write(content);
    _ = try file.write("\n");

    defer file.close();
}

pub fn counter (n: u32) u32 {
    return n+1;
}
