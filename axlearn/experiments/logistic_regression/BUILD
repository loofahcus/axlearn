load("//pytype_bazel:pytype.bzl", "pytype_library")

pytype_library(
    name = "__init__",
    srcs = ["__init__.py"],
    visibility = ["//visibility:public"],
)

pytype_library(
    name = "ax",
    srcs = ["ax.py"],
    visibility = ["//visibility:public"],
    deps = [
        "//axlearn/common:base_layer",
        "//axlearn/common:base_model",
        "//axlearn/common:checkpointer",
        "//axlearn/common:config",
        "//axlearn/common:evaler",
        "//axlearn/common:input_fake",
        "//axlearn/common:input_grain",
        "//axlearn/common:input_tf_data",
        "//axlearn/common:layers",
        "//axlearn/common:learner",
        "//axlearn/common:module",
        "//axlearn/common:optimizers",
        "//axlearn/common:schedule",
        "//axlearn/common:trainer",
        "//axlearn/common:utils",
    ],
)

pytype_library(
    name = "tutorial",
    srcs = ["tutorial.py"],
    enable_pytype = False,
    visibility = ["//visibility:public"],
    deps = [
        ":ax",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)
