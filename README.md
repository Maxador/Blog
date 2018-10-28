<p align="center">
    <img src="https://user-images.githubusercontent.com/1342803/36623515-7293b4ec-18d3-11e8-85ab-4e2f8fb38fbd.png" width="320" alt="API Template">
    <br>
    <br>
    <a href="http://docs.vapor.codes/3.0/">
        <img src="http://img.shields.io/badge/read_the-docs-2196f3.svg" alt="Documentation">
    </a>
    <a href="https://discord.gg/vapor">
        <img src="https://img.shields.io/discord/431917998102675485.svg" alt="Team Chat">
    </a>
    <a href="LICENSE">
        <img src="http://img.shields.io/badge/license-MIT-brightgreen.svg" alt="MIT License">
    </a>
    <a href="https://circleci.com/gh/vapor/api-template">
        <img src="https://circleci.com/gh/vapor/api-template.svg?style=shield" alt="Continuous Integration">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/swift-4.1-brightgreen.svg" alt="Swift 4.1">
    </a>
</p>

## To be able to use the Playground
We need to copy fake frameworks modulemap in the Framework folder on the
platform (macOS). [This post] (https://medium.com/@serzhit/how-to-make-vapor-3-swift-playground-in-xcode-10-c7147b0f7f18)
is a guide on how to proceed. This is a temporary step right now. It is probably
possible to change the xcode project build settings to look for a modulemap in
the project. Also, there is a possibility that the Swift-NIO library will be
usable in [Playgrounds](https://github.com/apple/swift-nio/pull/636). If Vapor
update to this version of NIO, it should be usable more easily in Playgrounds.
