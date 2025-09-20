load("//pytype_bazel:pytype.bzl", "pytype_binary", "pytype_library", "pytype_test")

package(default_visibility = ["//visibility:public"])

# Core flash attention utilities (depends on implementations)
pytype_library(
    name = "utils",
    srcs = ["utils.py"],
    deps = [
        ":common",
        ":gpu_attention",
        ":gpu_decoding",
        ":gpu_paged_attention",
        ":neuron_attention",
        ":tpu_attention",
        ":tpu_decoding",
        ":tpu_paged_attention",
        ":tpu_splash_attention",
        "//axlearn/common:attention",
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

# Common flash attention components
pytype_library(
    name = "common",
    srcs = ["common.py"],
    deps = [
        "//axlearn/common:attention",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "//axlearn/common/kv_cache:paged_kv_cache",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# Main flash attention layer
pytype_library(
    name = "layer",
    srcs = ["layer.py"],
    deps = [
        ":utils",
        "//axlearn/common:attention",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# TPU-specific attention implementation
pytype_library(
    name = "tpu_attention",
    srcs = ["tpu_attention.py"],
    deps = [
        ":common",
        "//axlearn/common:attention",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# TPU Splash attention implementation
pytype_library(
    name = "tpu_splash_attention",
    srcs = ["tpu_splash_attention.py"],
    deps = [
        ":common",
        "//axlearn/common:attention",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# TPU Paged attention implementation
pytype_library(
    name = "tpu_paged_attention",
    srcs = ["tpu_paged_attention.py"],
    deps = [
        ":common",
        "//axlearn/common:attention",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# GPU-specific attention implementation
pytype_library(
    name = "gpu_attention",
    srcs = ["gpu_attention.py"],
    deps = [
        ":common",
        "//axlearn/common:attention",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# GPU decoding implementation
pytype_library(
    name = "gpu_decoding",
    srcs = ["gpu_decoding.py"],
    deps = [
        ":common",
        "//axlearn/common:attention",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# GPU paged attention implementation
pytype_library(
    name = "gpu_paged_attention",
    srcs = ["gpu_paged_attention.py"],
    deps = [
        ":common",
        "//axlearn/common:attention",
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

# TPU paged attention kernel
pytype_library(
    name = "tpu_paged_attention_kernel",
    srcs = ["tpu_paged_attention_kernel.py"],
    deps = [
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "tpu_decoding",
    srcs = ["tpu_decoding.py"],
    deps = [
        ":common",
        ":tpu_paged_attention_kernel",
        "//axlearn/common:attention",
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

# Neuron-specific attention implementation
pytype_library(
    name = "neuron_attention",
    srcs = ["neuron_attention.py"],
    deps = [
        ":common",
        "//axlearn/common:attention",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# Remat utilities
pytype_library(
    name = "remat",
    srcs = ["remat.py"],
    deps = [
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
    ],
)

pytype_library(
    name = "test_utils",
    srcs = ["test_utils.py"],
    testonly = True,
    deps = [
        ":common",
        ":layer",
        ":utils",
        "//axlearn/common:attention",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

# Flash attention package that exports all components
pytype_library(
    name = "flash_attention",
    srcs = ["__init__.py"],
    deps = [
        ":common",
        ":gpu_attention",
        ":gpu_decoding",
        ":layer",
        ":neuron_attention",
        ":remat",
        ":tpu_attention",
        ":tpu_paged_attention",
        ":tpu_splash_attention",
        ":utils",
    ],
)

pytype_library(
    name = "layer_test_lib",
    srcs = ["layer_test.py"],
    testonly = True,  # Added testonly since it depends on test_utils
    deps = [
        ":layer",
        ":test_utils",
        "//axlearn/common:attention",
        "//axlearn/common:attention_bias",
        "//axlearn/common:base_layer",
        "//axlearn/common:config",
        "//axlearn/common:module",
        "//axlearn/common:test_utils",
        "//axlearn/common:utils",
        "//axlearn/common/kv_cache:kv_cache",
        "//axlearn/common/kv_cache:sliding_window_kv_cache",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

pytype_test(
    name = "common_test",
    srcs = ["common_test.py"],
    deps = [
        ":common",
        ":test_utils",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

pytype_test(
    name = "utils_test",
    srcs = ["utils_test.py"],
    deps = [
        ":test_utils",
        ":utils",
        "//axlearn/common:test_utils",
        "//axlearn/common/kv_cache:sliding_window_kv_cache",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

pytype_test(
    name = "tpu_attention_test",
    srcs = ["tpu_attention_test.py"],
    deps = [
        ":test_utils",
        ":tpu_attention",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

pytype_test(
    name = "gpu_attention_test",
    srcs = ["gpu_attention_test.py"],
    deps = [
        ":gpu_attention",
        ":test_utils",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

pytype_test(
    name = "neuron_attention_test",
    srcs = ["neuron_attention_test.py"],
    deps = [
        ":neuron_attention",
        ":test_utils",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

pytype_test(
    name = "decoding_test",
    srcs = ["decoding_test.py"],
    deps = [
        ":gpu_decoding",
        ":test_utils",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

# Benchmarks
pytype_binary(
    name = "gpu_attention_benchmark",
    srcs = ["gpu_attention_benchmark.py"],
    deps = [
        ":gpu_attention",
        ":test_utils",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

pytype_binary(
    name = "tpu_attention_benchmark",
    srcs = ["tpu_attention_benchmark.py"],
    deps = [
        ":test_utils",
        ":tpu_attention",
        "//axlearn/common:test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)
