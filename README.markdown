# JKSToolkit

JKSToolkit is a collection of general classes and categories for the various 
Cocoa frameworks.

**There are many like it but this one is mine.**


## Design & Guidelines

* Apple LLVM Compiler 3.1+ and the modern runtime required
* Uses ARC
* Prefix  everything, especially categories on Apples frameworks
* Documentation in the header file in AppleDoc format (http://gentlebytes.com/appledoc/)
* Unit tests where appropriate


## Usage

Currently not setup to build a static library or framework. Add the JKSToolkit 
repository as a git submodule, add any files you need to your project. Link 
against Security.framework for the hashing methods.


## License

MIT, see the LICENSE file distributed with this README

