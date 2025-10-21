load("//pytype_bazel:pytype.bzl", "pytype_library")

pytype_library(
    name = "__init__",
    srcs = ["__init__.py"],
    visibility = ["//visibility:public"],
    deps = [
        "//axlearn/experiments/text/gpt:__init__",
    ],
)

pytype_library(
    name = "common",
    srcs = ["common.py"],
    visibility = ["//visibility:public"],
    deps = [
        "//axlearn/common:config",
        "//axlearn/common:input_fake",
        "//axlearn/common:input_tf_data",
        "//axlearn/common:utils",
        "@axlearn_pip//seqio",
    ],
)
