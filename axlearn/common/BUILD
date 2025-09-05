load("//pytype_bazel:pytype.bzl", "pytype_binary", "pytype_library", "pytype_test")

pytype_library(
    name = "attention",
    srcs = ["attention.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":module",
        ":utils",
    ],
)

pytype_library(
    name = "base_layer",
    srcs = ["base_layer.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":metrics",
        ":module",
        ":param_init",
        ":traceback_util",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
    ],
)

pytype_library(
    name = "array_serialization",
    srcs = ["array_serialization.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//tensorstore",
    ],
)

pytype_library(
    name = "base_model",
    srcs = ["base_model.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":module",
    ],
)

pytype_library(
    name = "checkpointer",
    srcs = ["checkpointer.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":array_serialization",
        ":config",
        ":file_system",
        ":metrics",
        ":module",
        ":summary_writer",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//msgpack",
        "@axlearn_pip//tensorflow",
    ],
)

pytype_library(
    name = "compiler_options",
    srcs = ["compiler_options.py"],
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
        "@axlearn_pip//attrs",
    ],
)

pytype_library(
    name = "convolution",
    srcs = ["convolution.py"],
    enable_pytype = False,  # Complex dependencies
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":ein_ops",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "ein_ops",
    srcs = ["ein_ops.py"],
    enable_pytype = False,  # Complex dependencies
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":module",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "factorized_rms",
    srcs = ["factorized_rms.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":config",
        ":optimizer_base",
        ":schedule",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//optax",
    ],
)

pytype_library(
    name = "file_system",
    srcs = ["file_system.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//absl_py",
        "@axlearn_pip//tensorflow",
    ],
)

pytype_library(
    name = "device_monitor",
    srcs = ["monitoring/device_monitor.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":utils",
        "@axlearn_pip//absl_py",
    ],
)

pytype_library(
    name = "evaler",
    srcs = ["evaler.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_model",
        ":config",
        ":inference_output",
        ":input_base",
        ":metrics",
        ":module",
        ":struct",
        ":summary_writer",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
    ],
)

pytype_library(
    name = "inference_output",
    srcs = ["inference_output.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":file_system",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//tensorflow",
    ],
)

pytype_library(
    name = "input_base",
    srcs = ["input_base.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":input_dispatch",
        ":module",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
    ],
)

pytype_library(
    name = "input_dispatch",
    srcs = ["input_dispatch.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_test(
    name = "config_test",
    size = "small",
    srcs = ["config_test.py"],
    deps = [
        ":config",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//attrs",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
        "@axlearn_pip//wrapt",
    ],
)

pytype_library(
    name = "layers",
    srcs = ["layers.py"],
    enable_pytype = False,  # Type annotation errors require code fixes
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":convolution",
        ":loss",
        ":metrics_classification",
        ":module",
        ":param_init",
        ":quantized_dot_general_layers",
    ],
)

pytype_library(
    name = "quantized_dot_general_layers",
    srcs = [
        "quantized_dot_general/activation_clipping.py",
        "quantized_dot_general/layers.py",
        "quantized_dot_general/utils.py",
    ],
    enable_pytype = False,  # Complex dependencies
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":module",
        ":utils",
        "@axlearn_pip//aqtp",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "metrics_classification",
    srcs = ["metrics_classification.py"],
    enable_pytype = False,  # Complex dependencies
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "loss",
    srcs = ["loss.py"],
    enable_pytype = False,  # Complex dependencies
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":module",
        ":normalize",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "normalize",
    srcs = ["normalize.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//jax",
    ],
)

pytype_library(
    name = "learner",
    srcs = ["learner.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":config",
        ":learner_base",
        ":module",
        ":optimizer_base",
        ":optimizers",
        ":update_transformation",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//optax",
    ],
)

pytype_library(
    name = "learner_base",
    srcs = ["learner_base.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":module",
        ":optimizer_base",
        ":utils",
    ],
)

pytype_library(
    name = "param_init",
    srcs = ["param_init.py"],
    enable_pytype = False,  # Type annotation errors require code fixes
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":module",
    ],
)

pytype_library(
    name = "state_builder",
    srcs = ["state_builder.py"],
    enable_pytype = False,  # Missing imports and type annotation errors
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":input_fake",
        ":module",
        ":utils",
    ],
)

pytype_library(
    name = "schedule",
    srcs = ["schedule.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//optax",
    ],
)

pytype_library(
    name = "utils",
    srcs = ["utils.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":serialization",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//attrs",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "metrics",
    srcs = ["metrics.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":summary",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
    ],
)

pytype_library(
    name = "measurement",
    srcs = ["measurement.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        "@axlearn_pip//absl_py",
    ],
)

pytype_library(
    name = "module",
    srcs = ["module.py"],
    enable_pytype = False,  # Complex forward references and custom dataclass patterns
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":struct",
        ":summary",
        ":traceback_util",
        ":utils",
    ],
)

pytype_library(
    name = "optimizer_base",
    srcs = ["optimizer_base.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":utils",
        "@axlearn_pip//optax",
        "@axlearn_pip//typing_extensions",
    ],
)

pytype_library(
    name = "optimizers",
    srcs = ["optimizers.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":config",
        ":factorized_rms",
        ":module",
        ":optimizer_base",
        ":schedule",
        ":struct",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//chex",
        "@axlearn_pip//jax",
        "@axlearn_pip//optax",
        "@axlearn_pip//typing_extensions",
    ],
)

pytype_library(
    name = "serialization",
    srcs = ["serialization.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//jax",
    ],
)

pytype_test(
    name = "serialization_test",
    size = "small",
    srcs = ["serialization_test.py"],
    enable_pytype = False,  # Type error: No attribute 'replace' on _Box
    deps = [
        ":serialization",
        ":struct",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//optax",
        "@axlearn_pip//pytest",
    ],
)

pytype_library(
    name = "struct",
    srcs = ["struct.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":serialization",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//typing_extensions",
    ],
)

pytype_test(
    name = "struct_test",
    size = "small",
    srcs = ["struct_test.py"],
    deps = [
        ":struct",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//chex",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//pytest",
    ],
)

pytype_library(
    name = "summary",
    srcs = ["summary.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":struct",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "summary_writer",
    srcs = ["summary_writer.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":file_system",
        ":module",
        ":summary",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//tensorflow",
    ],
)

pytype_library(
    name = "traceback_util",
    srcs = ["traceback_util.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
    ],
)

pytype_library(
    name = "trainer",
    srcs = ["trainer.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":base_model",
        ":checkpointer",
        ":compiler_options",
        ":config",
        ":device_monitor",
        ":evaler",
        ":file_system",
        ":input_base",
        ":learner",
        ":measurement",
        ":module",
        ":optimizer_base",
        ":param_init",
        ":state_builder",
        ":summary_writer",
        ":update_transformation",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "update_transformation",
    srcs = ["update_transformation.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":config",
        ":learner_base",
        ":module",
        ":optimizer_base",
        ":struct",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//optax",
    ],
)

pytype_library(
    name = "status_server",
    srcs = ["status_server.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":utils",
        "@axlearn_pip//absl_py",
    ],
)

pytype_library(
    name = "utils_spmd",
    srcs = ["utils_spmd.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//jax",
        "@axlearn_pip//portpicker",
    ],
)

pytype_library(
    name = "launch",
    srcs = ["launch.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":compiler_options",
        ":status_server",
        ":utils",
        ":utils_spmd",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
    ],
)

pytype_library(
    name = "launch_trainer",
    srcs = ["launch_trainer.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":file_system",
        ":measurement",
        ":trainer",
        ":utils",
        "//axlearn/experiments:__init__",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
    ],
)

pytype_binary(
    name = "launch_trainer_main",
    srcs = ["launch_trainer_main.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":launch",
        ":launch_trainer",
        ":measurement",
        # Experiment modules for dynamic loading with all dependencies
        "//axlearn/experiments:__init__",
        "//axlearn/experiments:logistic_regression_tutorial",
        # Add other experiment modules here as they get Bazelized
        "@axlearn_pip//absl_py",
    ],
)

pytype_library(
    name = "input_fake",
    srcs = ["input_fake.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":input_base",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//tensorflow",
    ],
)

pytype_library(
    name = "input_grain",
    srcs = ["input_grain.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":input_base",
        ":module",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//array_record",
        "@axlearn_pip//grain",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)
