load("//pytype_bazel:pytype.bzl", "pytype_binary", "pytype_library", "pytype_test")

pytype_library(
    name = "mask_generator",
    srcs = ["mask_generator.py"],
    visibility = ["//visibility:public"],
    deps = [
        "@axlearn_pip//numpy",
    ],
)

pytype_test(
    name = "mask_generator_test",
    srcs = ["mask_generator_test.py"],
    visibility = ["//visibility:public"],
    deps = [
        ":mask_generator",
        "@axlearn_pip//numpy",
        "@axlearn_pip//absl_py",
    ],
)
