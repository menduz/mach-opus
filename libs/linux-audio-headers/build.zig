const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "linux-audio-headers",
        .root_module = b.createModule(.{
            .optimize = optimize,
            .target = target,
            .root_source_file = null, //b.addWriteFiles().add("empty.c", ""),
        }),
    });

    lib.installHeadersDirectory(b.path("alsa-lib"), ".", .{});
    lib.installHeadersDirectory(b.path("jack"), "jack", .{});
    lib.installHeadersDirectory(b.path("pipewire"), "pipewire", .{});
    lib.installHeadersDirectory(b.path("pulse"), "pulse", .{});
    lib.installHeadersDirectory(b.path("sndio"), ".", .{});
    lib.installHeadersDirectory(b.path("spa"), "spa", .{});

    b.installArtifact(lib);
}
