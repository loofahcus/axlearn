load("//pytype_bazel:pytype.bzl", "pytype_library")

# Main axlearn library that includes all common components
pytype_library(
    name = "axlearn",
    srcs = ["__init__.py"],
    visibility = ["//visibility:public"],
    deps = [
        "//axlearn/common",
        "//axlearn/common:attention",
        "//axlearn/common:base_layer",
        "//axlearn/common:base_model",
        "//axlearn/common:config",
        "//axlearn/common:ein_ops",
        "//axlearn/common:input_fake",
        "//axlearn/common:input_lm",
        "//axlearn/common:input_tf_data",
        "//axlearn/common:layers",
        "//axlearn/common:mixture_of_experts",
        "//axlearn/common:module",
        "//axlearn/common:quantized_dot_general_layers",
        "//axlearn/common:test_utils",
        "//axlearn/common:utils",
    ],
)
