load("//pytype_bazel:pytype.bzl", "pytype_library", "pytype_test")

package(default_visibility = ["//visibility:public"])

# Base KV cache module
pytype_library(
    name = "base_kv_cache",
    srcs = ["base_kv_cache.py"],
    deps = [
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# Main KV cache implementation
pytype_library(
    name = "kv_cache",
    srcs = ["kv_cache.py"],
    deps = [
        ":base_kv_cache",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "sliding_window_kv_cache",
    srcs = ["sliding_window_kv_cache.py"],
    deps = [
        ":base_kv_cache",
        "//axlearn/common:attention_bias",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "paged_kv_cache",
    srcs = ["paged_kv_cache.py"],
    deps = [
        ":base_kv_cache",
        ":paged_kv_cache_gpu_kernel",
        ":paged_kv_cache_tpu_kernel",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# TPU kernel for paged KV cache
pytype_library(
    name = "paged_kv_cache_tpu_kernel",
    srcs = ["paged_kv_cache_tpu_kernel.py"],
    deps = [
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# GPU kernel for paged KV cache
pytype_library(
    name = "paged_kv_cache_gpu_kernel",
    srcs = ["paged_kv_cache_gpu_kernel.py"],
    deps = [
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# KV cache package
pytype_library(
    name = "kv_cache_lib",
    srcs = ["__init__.py"],
    deps = [
        ":base_kv_cache",
        ":kv_cache",
        ":paged_kv_cache",
        ":paged_kv_cache_gpu_kernel",
        ":paged_kv_cache_tpu_kernel",
        ":sliding_window_kv_cache",
    ],
)

# Tests
pytype_test(
    name = "kv_cache_test",
    srcs = ["kv_cache_test.py"],
    deps = [
        ":kv_cache",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_test(
    name = "paged_kv_cache_test",
    srcs = ["paged_kv_cache_test.py"],
    deps = [
        ":kv_cache",
        ":paged_kv_cache",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

pytype_test(
    name = "sliding_window_kv_cache_test",
    srcs = ["sliding_window_kv_cache_test.py"],
    deps = [
        ":sliding_window_kv_cache",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)
