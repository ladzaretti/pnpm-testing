load("//tools/jest:jest.bzl",  _jest_test = "jest_test")
load("//tools/go:go.bzl", _test_go_fmt = "test_go_fmt")
load("@io_bazel_rules_go//go:def.bzl", _go_library = "go_library", _go_test = "go_test", _go_binary = "go_binary")
load("@npm//@bazel/typescript:index.bzl", _ts_project = "ts_project")
load("@npm//eslint:index.bzl", _eslint_test = "eslint_test")
load("@npm//@bazel/typescript:index.bzl", _ts_config = "ts_config")
load("@build_bazel_rules_nodejs//:index.bzl", _nodejs_binary = "nodejs_binary", "js_library")

def nodejs_binary(**kwargs):
    _nodejs_binary(**kwargs)

def ts_config(**kwargs):
    _ts_config(**kwargs)

def jest_test(project_deps = [], jsdom = None, deps = [], **kwargs):
    extra_deps = [ "@npm//jsdom" ] if jsdom else []
    _jest_test(
        deps = deps + [ x + "_js" for x in project_deps ] + extra_deps,
        jest_config = "//:jest_config_browser" if jsdom else "//:jest_config_node",
        **kwargs
    )

def ts_declarations(name = None, **kwargs):
    js_library(name = name, **kwargs)
    ts_lint(
        name = name + "_lint",
        **kwargs
    )

def ts_lint(name, srcs = [], tags = [], data = [], **kwargs):
    targets = srcs + data
    eslint_test(
            name = name,
            data = targets,
            tags = tags + ["+formatting"],
            args = ["$(location %s)" % x for x in targets],
            **kwargs
    )


def ts_project(name, ignores_lint = [], resolve_json_module = None, project_deps = [], deps = [], srcs = [], incremental = True, composite = True, tsconfig = "//:tsconfig", declaration = True, preserve_jsx = None, root_dir = None, **kwargs):
    __ts_project(
        name = name + "_ts",
        deps = deps + [dep + "_ts" for dep in project_deps ],
        srcs = srcs,
        composite = composite,
        declaration = declaration,
        tsconfig = tsconfig,
        preserve_jsx = preserve_jsx,
        incremental = incremental,
        resolve_json_module = resolve_json_module,
        root_dir = root_dir,
        ignores_lint = ignores_lint,
        **kwargs
    )

    jssrcs = []

    suffixes = {
        ".d.ts": [],
        ".tsx": [".js"],
        ".ts": [".js"]
    }

    for s in srcs:
        found = False
        for suffix, targets in suffixes.items():
            if found:
                break

            if s[-len(suffix):] == suffix:
                for target in targets:
                    jssrcs.append(
                        s[:-len(suffix)] + target
                    )
                found = True



    js_library(
        name = name + "_js",
        deps = [ dep + "_js" for dep in project_deps ] + deps,
        srcs = jssrcs,
        **kwargs
    )


def __ts_project(name, ignores_lint = [], tags = [], deps = [], srcs = [], tsconfig = "//:tsconfig", **kwargs):
    _ts_project(
        name = name,
        tsc = "@npm//ttypescript/bin:ttsc",
	srcs = srcs,
        deps = deps + ["@npm//typescript-transform-paths"],
        tags = tags,
        tsconfig = tsconfig,
        **kwargs,
    )

    ts_lint(name = name + "_lint", data = [x for x in srcs if x not in ignores_lint ], tags = tags)

def eslint_test(name = None, data = [], args = [], **kwargs):
    _eslint_test(
        name = name,
        data = data + [
            "//:.prettierrc.json",
            "//:.gitignore",
            "//:.editorconfig",
            "//:.eslintrc.json",

            "@npm//eslint-plugin-prettier", "@npm//@typescript-eslint/parser",
            "@npm//@typescript-eslint/eslint-plugin", "@npm//eslint-config-prettier"
        ],
        args = args + [ "--ignore-path", "$(location //:.gitignore)" ] +
            [ "$(location " + x + ")" for x in data ]
    )

def go_binary(name = None, importpath = None, deps = [], **kwargs):
    _go_binary(
        name = name,
        deps = deps,
        importpath = importpath,
        **kwargs
    )

    _test_go_fmt(
        name = name + "_fmt",
        **kwargs
    )


def go_test(name = None, importpath = None, deps = [], **kwargs):
    _go_test(
        name = name,
        deps = deps,
        importpath = importpath,
        **kwargs
    )

    _test_go_fmt(
        name = name + "_fmt",
        **kwargs
    )

def go_library(name = None, importpath = None, deps = [], **kwargs):
    _go_library(
        name = name,
        deps = deps,
        importpath = importpath,
        **kwargs
    )

    _test_go_fmt(
        name = name + "_fmt",
        **kwargs
    )

