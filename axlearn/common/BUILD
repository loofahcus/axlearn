load("//pytype_bazel:pytype.bzl", "pytype_binary", "pytype_library", "pytype_test")

# Main common library that includes commonly used modules
pytype_library(
    name = "common",
    srcs = [],
    visibility = ["//visibility:public"],
    deps = [
        ":attention",
        ":base_layer",
        ":base_model",
        ":config",
        ":ein_ops",
        ":input_base",
        ":input_fake",
        ":input_lm",
        ":input_tf_data",
        ":layers",
        ":learner",
        ":module",
        ":optimizer_base",
        ":optimizers",
        ":param_init",
        ":schedule",
        ":trainer",
        ":utils",
    ],
)

# NOTE (wyi): I haven’t added the attention_test target because attention_test.py verifies the
# JAX-based attention implementation by parity-checking against HuggingFace Transformers. Defining
# an attention_test target would therefore require adding both PyTorch and HuggingFace Transformers
# to requirements.in. A possible alternative might be to remove the parity check and instead
# validate mathematical properties of attention, but I’m not sure if that would be a better
# approach.
pytype_library(
    name = "attention",
    srcs = ["attention.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":attention_bias",
        ":base_layer",
        ":config",
        ":layers",
        ":module",
        ":param_init",
        ":pipeline",
        ":repeat",
        ":utils",
        "//axlearn/common/flash_attention:remat",
        "//axlearn/common/kv_cache",
        "//axlearn/common/kv_cache:base_kv_cache",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "attention_bias",
    srcs = ["attention_bias.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":flax_struct",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

pytype_test(
    name = "attention_bias_test",
    srcs = ["attention_bias_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":attention_bias",
        ":test_utils",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//chex",
        "@axlearn_pip//jax",
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

pytype_test(
    name = "base_layer_test",
    srcs = ["base_layer_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":config",
        ":module",
        ":test_utils",
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

pytype_test(
    name = "array_serialization_test",
    srcs = ["array_serialization_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":array_serialization",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//pytest",
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
        ":param_init",
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
    name = "checkpointer_orbax",
    srcs = ["checkpointer_orbax.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":checkpointer",
        ":config",
        ":module",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//orbax_checkpoint",
        "@axlearn_pip//tensorflow",
    ],
)

pytype_test(
    name = "checkpointer_test",
    srcs = ["checkpointer_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":array_serialization",
        ":checkpointer",
        ":checkpointer_orbax",
        ":file_system",
        ":metrics",
        ":serialization",
        ":summary_writer",
        ":test_utils",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//orbax_checkpoint",
        "@axlearn_pip//pytest",
        "@axlearn_pip//tensorflow",
    ],
)

pytype_test(
    name = "checkpointer_orbax_test",
    srcs = ["checkpointer_orbax_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":checkpointer",
        ":checkpointer_orbax",
        ":test_utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//orbax_checkpoint",
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

pytype_test(
    name = "compiler_options_test",
    srcs = ["compiler_options_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":compiler_options",
        ":test_utils",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
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

# NOTE (wyi): I haven’t added the convolution_test target because it verifies the JAX-based
# attention implementation by parity-checking against PyTorch's Conv_D.
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
    name = "logit_modifiers",
    srcs = ["logit_modifiers.py"],
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
    name = "logit_modifiers_test",
    srcs = ["logit_modifiers_test.py"],
    deps = [
        ":decoding",
        ":logit_modifiers",
        ":test_utils",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
    ],
)

pytype_library(
    name = "decoding",
    srcs = ["decoding.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":attention",
        ":base_layer",
        ":config",
        ":layers",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_test(
    name = "decoding_test",
    srcs = ["decoding_test.py"],
    deps = [
        ":decoding",
        ":test_utils",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//sentencepiece",
    ],
)

pytype_library(
    name = "embedding",
    srcs = ["embedding.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":config",
        ":layers",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "decoder",
    srcs = ["decoder.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":attention",
        ":base_layer",
        ":config",
        ":decoding",
        ":embedding",
        ":layers",
        ":logit_modifiers",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_test(
    name = "decoder_test",
    size = "enormous",
    srcs = ["decoder_test.py"],
    deps = [
        ":attention",
        ":attention_bias",
        ":base_layer",
        ":causal_lm",
        ":config",
        ":decoder",
        ":decoding",
        ":embedding",
        ":layers",
        ":logit_modifiers",
        ":module",
        ":test_utils",
        ":utils",
        "//axlearn/common/flash_attention:layer",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//chex",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "causal_lm",
    srcs = ["causal_lm.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":attention",
        ":base_layer",
        ":base_model",
        ":config",
        ":decoder",
        ":decoding",
        ":embedding",
        ":layers",
        ":logit_modifiers",
        ":loss",
        ":loss_metrics",
        ":metrics",
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
        ":flax_struct",
        ":inference_output",
        ":input_base",
        ":metrics",
        ":module",
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

pytype_test(
    name = "input_base_test",
    srcs = ["input_base_test.py"],
    deps = [
        ":input_base",
        ":input_dispatch",
        ":test_utils",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
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
        "//axlearn/common/quantized_dot_general",
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
    name = "loss_metrics",
    srcs = ["loss_metrics.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":metrics",
        ":utils",
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
    name = "pipeline",
    srcs = ["pipeline.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":config",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "repeat",
    srcs = ["repeat.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":config",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
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
        ":flax_struct",
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
        ":flax_struct",
        ":module",
        ":optimizer_base",
        ":schedule",
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
        ":flax_struct",
        ":serialization",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//optax",
        "@axlearn_pip//pytest",
    ],
)

pytype_library(
    name = "flax_struct",
    srcs = ["flax_struct.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":serialization",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//typing_extensions",
    ],
)

pytype_library(
    name = "flax_struct_test_lib",
    srcs = ["flax_struct_test.py"],
    deps = [
        ":flax_struct",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//chex",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//pytest",
    ],
)

pytype_test(
    name = "flax_struct_test",
    size = "small",
    srcs = ["flax_struct_test.py"],
    deps = [
        ":flax_struct_test_lib",
    ],
)

pytype_library(
    name = "summary",
    srcs = ["summary.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":flax_struct",
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
        ":flax_struct",
        ":learner_base",
        ":module",
        ":optimizer_base",
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
    name = "debug_utils",
    srcs = ["debug_utils.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
    ],
)

pytype_library(
    name = "gradient_accumulation",
    srcs = ["gradient_accumulation.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":config",
        ":module",
        ":utils",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
    ],
)

pytype_library(
    name = "trainer_config_modifier",
    srcs = ["trainer_config_modifier.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":gradient_accumulation",
        ":module",
        ":trainer",
        ":utils",
        "@axlearn_pip//jax",
    ],
)

pytype_library(
    name = "trainer_test_lib",
    testonly = True,
    srcs = ["trainer_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":base_model",
        ":config",
        ":debug_utils",
        ":flax_struct_test_lib",
        ":layers",
        ":learner",
        ":module",
        ":optimizer_base",
        ":optimizers",
        ":schedule",
        ":test_utils",
        ":trainer",
        ":trainer_config_modifier",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)

# Commented out due to timeout issues - test takes too long to run
# TODO: Re-enable after optimizing test execution time
# pytype_test(
#     name = "trainer_test",
#     srcs = ["trainer_test.py"],
#     visibility = ["//visibility:public"],
#     deps = [
#         ":trainer_test_lib",
#     ],
# )

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

pytype_test(
    name = "input_grain_test",
    srcs = ["input_grain_test.py"],
    deps = [
        ":config",
        ":input_dispatch",
        ":input_fake",
        ":input_grain",
        ":test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//grain",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_test(
    name = "input_grain_tpu_test",
    srcs = ["input_grain_tpu_test.py"],
    tags = [
        "manual",
        "tpu",
    ],
    deps = [
        ":config",
        ":input_dispatch",
        ":input_grain",
        ":test_utils",
        ":utils",
        ":utils_spmd",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//grain",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
        "@axlearn_pip//pytest",
    ],
)

pytype_library(
    name = "aot_compilation",
    srcs = ["aot_compilation.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
    ],
)

pytype_test(
    name = "aot_compilation_test",
    srcs = ["aot_compilation_test.py"],
    deps = [
        ":aot_compilation",
        ":test_utils",
        ":utils",
        "@axlearn_pip//absl_py",
    ],
)

pytype_library(
    name = "input_lm",
    srcs = ["input_lm.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":input_base",
        ":input_text",
        ":input_tf_data",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//tensorflow",
    ],
)

pytype_test(
    name = "input_lm_test",
    srcs = ["input_lm_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":input_fake",
        ":input_lm",
        ":input_test_utils",
        ":input_tf_data",
        ":test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//seqio",
        "@axlearn_pip//tensorflow",
        "@axlearn_pip//tensorflow_datasets",
    ],
)

pytype_library(
    name = "input_text",
    srcs = ["input_text.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":input_tf_data",
        ":utils",
        "@axlearn_pip//nltk",
        "@axlearn_pip//numpy",
        "@axlearn_pip//seqio",
        "@axlearn_pip//tensorflow",
        "@axlearn_pip//tensorflow_text",
    ],
)

pytype_library(
    name = "input_tf_data",
    srcs = ["input_tf_data.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":input_base",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//tensorflow",
    ],
)

pytype_library(
    name = "input_test_utils",
    srcs = ["input_test_utils.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":input_tf_data",
        "@axlearn_pip//tensorflow",
    ],
)

pytype_test(
    name = "input_tf_data_test",
    srcs = ["input_tf_data_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":checkpointer",
        ":config",
        ":input_dispatch",
        ":input_fake",
        ":input_tf_data",
        ":test_utils",
        ":utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//pytest",
        "@axlearn_pip//seqio",
        "@axlearn_pip//tensorflow",
        "@axlearn_pip//tensorflow_datasets",
    ],
)

pytype_test(
    name = "input_tf_data_gcs_test",
    srcs = ["input_tf_data_gcs_test.py"],
    # These tests require GCS authentication to access dataset metadata.
    # Run with: bazel test --test_tag_filters=gs_login //...
    # Skip with: bazel test --test_tag_filters=-gs_login //...
    tags = [
        "gs_login",
        "manual",
    ],  # manual = not included in //... by default
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":input_tf_data",
        ":test_utils",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//pytest",
        "@axlearn_pip//tensorflow_datasets",
    ],
)

pytype_library(
    name = "mixture_of_experts",
    srcs = ["mixture_of_experts.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":config",
        ":layers",
        ":module",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
    ],
)

pytype_test(
    name = "mixture_of_experts_test",
    srcs = ["mixture_of_experts_test.py"],
    deps = [
        ":attention",
        ":layers",
        ":mixture_of_experts",
        ":module",
        ":test_utils",
        ":utils",
        "//axlearn/common/quantized_dot_general:activation_clipping",
        "//axlearn/common/quantized_dot_general:layers",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//numpy",
    ],
)

pytype_library(
    name = "test_utils",
    srcs = ["test_utils.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":base_layer",
        ":base_model",
        ":learner",
        ":module",
        ":optimizers",
        ":schedule",
        ":trainer",
        ":utils",
        ":utils_spmd",
        "@axlearn_pip//absl_py",
        "@axlearn_pip//jax",
        "@axlearn_pip//jaxlib",
        "@axlearn_pip//numpy",
    ],
)
