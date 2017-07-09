# Programmatically define third-party dependencies so that external clients can load them
def bazeltrunk_workspace(workspace_name):
    if len(workspace_name) > 0 and not workspace_name.startswith("@"):
        workspace_name = "@" + workspace_name

    # gtest
    native.new_http_archive(
        name = "gtest_archive",
        url = "https://github.com/google/googletest/archive/release-1.8.0.tar.gz",
        strip_prefix = "googletest-release-1.8.0",
        sha256 = "58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8",
        build_file = workspace_name + "//third_party:gtest.BUILD",
    )
    native.bind(
        name = "gtest",
        actual = "@gtest_archive//:gtest",
    )
    native.bind(
        name = "gtest_main",
        actual = "@gtest_archive//:gtest_main",
    )
    native.bind(
        name = "gmock",
        actual = "@gtest_archive//:gmock",
    )
    native.bind(
        name = "gmock_main",
        actual = "@gtest_archive//:gmock_main",
    )

    # gflags
    native.git_repository(
        name = "com_github_gflags_gflags",
        remote = "https://github.com/gflags/gflags.git",
        commit = "4a694e87361d08eff5c4c9e9f551b1a0d41f7c40",
    )
    native.bind(
        name = "gflags",
        actual = "@com_github_gflags_gflags//:gflags",
    )

    # libunwind
    native.new_git_repository(
        name = "libunwind_git",
        remote = "git://git.sv.gnu.org/libunwind.git",
        tag = "v1.2.1", # Note: update the version in BUILD file
        build_file = workspace_name + "//third_party:libunwind.BUILD",
    )
    native.bind(
        name = "libunwind",
        actual = "@libunwind_git//:libunwind",
    )
    native.bind(
        name = "libunwind_config",
        actual = workspace_name + "//third_party/libunwind:config"
    )

    # glog
    native.new_http_archive(
        name = "glog_archive",
        url = "https://github.com/google/glog/archive/v0.3.5.tar.gz",
        strip_prefix = "glog-0.3.5",
        sha256 = "7580e408a2c0b5a89ca214739978ce6ff480b5e7d8d7698a2aa92fadc484d1e0",
        build_file = workspace_name + "//third_party:glog.BUILD",
    )
    native.bind(
        name = "glog",
        actual = "@glog_archive//:glog",
    )
    native.bind(
        name = "glog_config",
        actual = workspace_name + "//third_party/glog:config"
    )
