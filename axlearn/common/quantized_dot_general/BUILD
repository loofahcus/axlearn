load("//pytype_bazel:pytype.bzl", "pytype_library", "pytype_test")

package(default_visibility = ["//visibility:public"])

pytype_library(
    name = "quantized_dot_general",
    srcs = [
        "__init__.py",
        "activation_clipping.py",
        "layers.py",
        "utils.py",
    ],
    enable_pytype = False,  # Complex dependencies
    deps = [
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//aqtp",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "layers",
    srcs = ["layers.py"],
    enable_pytype = False,  # Complex dependencies
    deps = [
        ":activation_clipping",
        ":utils",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//aqtp",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "utils",
    srcs = ["utils.py"],
    enable_pytype = False,  # Complex dependencies
    deps = [
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//aqtp",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "activation_clipping",
    srcs = ["activation_clipping.py"],
    enable_pytype = False,  # Complex dependencies
    deps = [
        "//axlearn/common:config",
        "//axlearn/common:module",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "fp8_ops",
    srcs = ["fp8_ops.py"],
    enable_pytype = False,  # Complex dependencies
    deps = [
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_test(
    name = "layers_test",
    size = "small",
    srcs = ["layers_test.py"],
    deps = [
        ":activation_clipping",
        ":layers",
        ":utils",
        "//axlearn/common:decoder",
        "//axlearn/common:module",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

pytype_test(
    name = "utils_test",
    size = "small",
    srcs = ["utils_test.py"],
    deps = [
        ":utils",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//aqtp",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)
