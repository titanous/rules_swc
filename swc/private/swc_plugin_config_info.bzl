"SwcPluginConfigInfo provider"

SwcPluginConfigInfo = provider(
    doc = "Provides a configuration for an SWC plugin",
    fields = {
        "label": "the label of the target that created this provider",
        "config": "the plugin configuration",
    },
)
