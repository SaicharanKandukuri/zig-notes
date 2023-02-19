const std = @import("std");
const capy = @import("capy");
const util = @import("./utils.zig");

pub usingnamespace capy.cross_platform;
var Aw: capy.Window = undefined;

pub fn main() !void {
    // Capy init for backend
    try capy.backend.init();
    // Create window
    Aw = try capy.Window.init();

    // setup for texts in container
    try Aw.set(
        capy.Column(
            //  Column props
            .{},
            // Column children
            .{
                capy.Label(.{ .text = "Note 📝" }),
                capy.TextField(.{ .name="the feild" , .text = "..." }),
                capy.Align(.{ .x = 1 }, capy.Button(.{ .label = "Add ➕", .onclick = stdLog})),
            }
        ),
    );

    Aw.setTitle("Zig-Notes (DEV)");
    Aw.resize(400, 400);
    Aw.show();

    // Capy main loop
    capy.runEventLoop();
}

fn stdLog(widget: *anyopaque) !void {
    const button = @ptrCast(
        *capy.Button_Impl,
        @alignCast(
            @alignOf(capy.Button_Impl),
            widget,
        ),
    );

    const parent = button.getParent().?.getParent().?.as(capy.Container_Impl);
    //                    ^~~~~~~~      ^~~~~~~~~~~
    //                     (Align)       (Column)
    const text = parent.getChildAs(capy.TextField_Impl, "the feild").?;
    //                             ^~~~~~~~~~~~~~~~~~~   ^~~~~~~~~
    //                              (TextField <type>)          (name)

    const time = std.time.timestamp();
    std.debug.print("{any}: Button clicked: {s}\n", .{time,text.get("text")});

    try util.Write(text.get("text"));
}


fn writeNote(widget: *anyopaque) !void {
    const button = @ptrCast(
        *capy.Button_Impl,
        @alignCast(
            @alignOf(capy.Button_Impl),
            widget,
        ),
    );

    const parent = button.getParent().?.getParent().?.as(capy.Container_Impl);
    const text = parent.getChildAs(capy.TextField_Impl, "the feild").?;
    const time = std.time.timestamp();
    std.debug.print("{any}: Button clicked: {s}\n", .{time,text.get("text")});
    // finally get text from text field


}
