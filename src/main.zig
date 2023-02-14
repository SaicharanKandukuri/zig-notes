const std = @import("std");
const capy = @import("capy");


pub fn main() !void {

    try capy.backend.init();
    var window = try capy.Window.init();

    // try window.set(capy.Tabs(
    //     .{
    //         capy.Tab(
    //             .{ .label = "Tab 2" },
    //             capy.Column(
    //                 .{}, .{
    //                     capy.Button(.{ .label = "Button 1" }),
    //                     capy.Button(.{ .label = "Button 2" }),
    //                     capy.Button(.{ .label = "Button 3" }),
    //                 }
    //             )
    //         )
    //     }
    // ));

    try window.set(
        capy.Row(
            .{},
            .{
                
            }
        )
    );

    window.resize(800, 600);
    window.show();
    capy.runEventLoop();
}
