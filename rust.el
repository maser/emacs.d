(add-to-list 'load-path "/home/maser/dev/rust/racer/editors")
(setq racer-rust-src-path "/home/maser/dev/rust/rustc-1.0.0/src")
(setq racer-cmd "/home/maser/dev/rust/racer/target/release/racer")
(eval-after-load "rust-mode" '(require 'racer))
