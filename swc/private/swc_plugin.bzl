"Internal implementation details"

load(":swc_plugin_config_info.bzl", "SwcPluginConfigInfo")

_attrs = {
    "src": attr.label(
        doc = "label for the plugin, either a directory containing a package.json pointing at a wasm file as the main entrypoint, or a wasm file",
        providers = [DefaultInfo],
        mandatory = True,
        allow_single_file = True,
    ),
    "config": attr.string(
        doc = "configuration object for the plugin, serialized JSON",
        default = "{}",
    ),
}

def _impl(ctx):
    return [
        DefaultInfo(
            files = ctx.attr.src[DefaultInfo].files,
        ),
        SwcPluginConfigInfo(
            label = ctx.label,
            config = ctx.attr.config,
        ),
    ]

swc_plugin = struct(
    attrs = _attrs,
    implementation = _impl,
    provides = [DefaultInfo, SwcPluginConfigInfo],
)
