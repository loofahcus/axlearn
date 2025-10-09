load("//pytype_bazel:pytype.bzl", "pytype_library")

pytype_library(
    name = "hf_text_encoder",
    srcs = ["hf_text_encoder.py"],
    enable_pytype = False,
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//torch",
        "@axlearn_pip//transformers",
    ],
)
