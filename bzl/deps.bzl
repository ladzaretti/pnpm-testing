# Third-party dependencies fetched by Bazel
# Unlike WORKSPACE, the content of this file is unordered.
# We keep them separate to make the WORKSPACE file more maintainable.

# Install the nodejs "bootstrap" package
# This provides the basic tools for running and packaging nodejs programs in Bazel
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

def fetch_dependencies():
    http_archive(
        name = "bazel_skylib",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz",
        ],
        sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
    )

    http_archive(
        name = "build_bazel_rules_nodejs",
        sha256 = "493bb318d98bb7492cb30e534ad33df2fc5539b43d4dcc4e294a5cc60a126902",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/5.5.4/rules_nodejs-5.5.4.tar.gz"],
    )

    http_archive(
        name = "rules_python",
        sha256 = "00b25b02dc4593d620fccdd6c6069a202b87ac56f8446fab1a8101da557da2c2",
        strip_prefix = "rules_python-0.10.1",
        url = "https://github.com/bazelbuild/rules_python/archive/refs/tags/0.10.1.tar.gz",
    )

    http_archive(
        name = "io_bazel_rules_go",
        sha256 = "099a9fb96a376ccbbb7d291ed4ecbdfd42f6bc822ab77ae6f1b5cb9e914e94fa",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
            "https://github.com/bazelbuild/rules_go/releases/download/v0.35.0/rules_go-v0.35.0.zip",
        ],
    )

    http_archive(
        name = "io_bazel_rules_docker",
        sha256 = "b1e80761a8a8243d03ebca8845e9cc1ba6c82ce7c5179ce2b295cd36f7e394bf",
        strip_prefix = "rules_docker-0.25.0",
        urls = ["https://github.com/bazelbuild/rules_docker/releases/download/v0.25.0/rules_docker-v0.25.0.tar.gz"],
    )

    http_archive(
        name = "rules_proto",
        sha256 = "66bfdf8782796239d3875d37e7de19b1d94301e8972b3cbd2446b332429b4df1",
        strip_prefix = "rules_proto-4.0.0",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/refs/tags/4.0.0.tar.gz",
            "https://github.com/bazelbuild/rules_proto/archive/refs/tags/4.0.0.tar.gz",
        ],
    )

    http_archive(
        name = "com_google_protobuf",
        sha256 = "d7d204a59fd0d2d2387bd362c2155289d5060f32122c4d1d922041b61191d522",
        strip_prefix = "protobuf-3.21.5",
        urls = [
            "https://github.com/protocolbuffers/protobuf/archive/v3.21.5.tar.gz",
        ],
    )

    http_archive(
        name = "rules_typescript_proto",
        sha256 = "aac6dec2c8d55da2b2c2689b7a2afe44b691555cab32e2eaa2bdd29627d950e9",
        strip_prefix = "rules_typescript_proto-1.0.1",
        urls = [
            "https://github.com/Dig-Doug/rules_typescript_proto/archive/1.0.1.tar.gz",
        ],
    )

    http_archive(
        name = "rules_pkg",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.7.1/rules_pkg-0.7.1.tar.gz",
            "https://github.com/bazelbuild/rules_pkg/releases/download/0.7.1/rules_pkg-0.7.1.tar.gz",
        ],
        sha256 = "451e08a4d78988c06fa3f9306ec813b836b1d076d0f055595444ba4ff22b867f",
    )

    http_archive(
        name = "bazel_gazelle",
        sha256 = "501deb3d5695ab658e82f6f6f549ba681ea3ca2a5fb7911154b5aa45596183fa",
        urls = [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-gazelle/releases/download/v0.26.0/bazel-gazelle-v0.26.0.tar.gz",
            "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.26.0/bazel-gazelle-v0.26.0.tar.gz",
        ],
    )

    http_archive(
        name = "com_google_protobuf",
        sha256 = "9b4ee22c250fe31b16f1a24d61467e40780a3fbb9b91c3b65be2a376ed913a1a",
        strip_prefix = "protobuf-3.13.0",
        urls = [
            "https://github.com/protocolbuffers/protobuf/archive/v3.13.0.tar.gz",
        ],
    )

    http_archive(
        name = "com_github_bazelbuild_buildtools",
        sha256 = "ae34c344514e08c23e90da0e2d6cb700fcd28e80c02e23e4d5715dddcb42f7b3",
        strip_prefix = "buildtools-4.2.2",
        urls = [
            "https://github.com/bazelbuild/buildtools/archive/refs/tags/4.2.2.tar.gz",
        ],
    )

    http_file(
        name = "inkscape_linux",
        sha256 = "b7a99b6c0ee2817706e77803643f4a6caf9e35bdec928e963c1d2ae86e5e4beb",
        urls = ["https://inkscape.org/es/gallery/item/31669/Inkscape-0a00cf5-x86_64.AppImage"],
        executable = True,
        downloaded_file_path = "bin",
    )

    http_archive(
        name = "pulumi_cli",
        sha256 = "8ea5c5b207067f3d037b77e027f52cab6994c2199bd39d5a63e8c2302468a7f4",
        urls = [
            "https://get.pulumi.com/releases/sdk/pulumi-v3.39.3-linux-x64.tar.gz",
        ],
        build_file_content = """
exports_files(glob(["**/*"]))
        """,
    )

    http_archive(
        name = "cultistsimulator",
        strip_prefix = "cultistsimulator-visible-2022.3.n.1",
        urls = [
            "https://github.com/weatherfactory/cultistsimulator-visible/archive/refs/tags/v2022.3.n.1.tar.gz",
        ],
        sha256 = "c640c454db8bd2ef4b53cf00edffa959d6c6147718bafce9a43f48db286f2ea2",
        build_file_content = """
filegroup(
    name = "core",
    srcs = glob(["Assets/StreamingAssets/content/core/**/*.json"]),
    visibility = [ "//visibility:public" ]
)
exports_files(glob(["**/*"], exclude_directories=0))
        """,
        # exports_files(glob(["**/*"]), visibility=["//visibility:public"])
    )

    git_repository(
        name = "bazel_tools",
        branch = "master",
        remote = "git@github.com:attilaolah/bazel-tools.git",
    )

    http_archive(
        name = "aspect_rules_swc",
        sha256 = "b5cc3bf8d255ea80f3b15a7d5932729a89922726c852f9c63811cee557227231",
        strip_prefix = "rules_swc-0.13.0",
        url = "https://github.com/aspect-build/rules_swc/archive/refs/tags/v0.13.0.tar.gz",
    )
