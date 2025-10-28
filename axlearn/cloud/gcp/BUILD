load("//pytype_bazel:pytype.bzl", "pytype_library", "pytype_test")

# TODO(axlearn-dev): Add bazel rule for utils_test.
pytype_library(
    name = "utils",
    srcs = ["utils.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//absl_py",
    ],
)

pytype_library(
    name = "bundler",
    srcs = ["bundler.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//absl_py",
    ],
)

pytype_library(
    name = "config",
    srcs = ["config.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//absl_py",
    ],
)

pytype_library(
    name = "measurement",
    srcs = ["measurement.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//absl_py",
        "//axlearn/cloud/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//ml_goodput_measurement",
        "@axlearn_pip//psutil",
    ],
)

pytype_test(
    name = "measurement_test",
    srcs = ["measurement_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":measurement",
        "@axlearn_pip//absl_py",
    ],
)

# TODO(axlearn-dev): Add bazel rule for tpu_test.
pytype_library(
    name = "tpu",
    srcs = ["tpu.py"],
    visibility = ["//visibility:public"],
    deps = [
        "//axlearn/common",
        "@axlearn_pip//absl_py",
    ],
)
