# HostingView

This repo is to demonstrate when a parent UIViewRepresentable is dismissed, its child view still get re-rendered.

## Steps

1. Run app, console should print `1 appear`
2. Tap `To Normal`
3. `1 appear` is printed on console, although we expect not to print anything as the parent view has been replaced by another view
4. If we comment out `super.viewDidAppear` (line 18 of UIHostingView.swift) or `super.viewWillDisappear` (line 24 of UIHostingView.swift), the message `1 appear` will not be printed. However not calling `super` may cause other unwanted issues.
